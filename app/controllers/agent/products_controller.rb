class Agent::ProductsController < Agent::BaseController
  before_action :set_current_user_products
  before_action :set_product, only: [:show, :edit, :update, :destroy, :process_shelves, :sales_distribution]
  before_action :set_site_tags, only: [:edit, :new]
  before_action :set_product_price, only: [:create, :update, :index]

  def index
    authorize Product
    @catalogs = ProductCatalog.roots
    # 搜索查询
    if params[:search].present?
      conditions = []
      query = []
      keywords = params[:search][:keywords]
      price_form = params[:search][:price_from].to_f
      price_to = params[:search][:price_to].to_f
      if !keywords.blank?
        query << "(name like ? or features ->> 'description' like ?)"
        conditions << "%" + keywords + "%"
        conditions << "%" + keywords + "%"
      end
      if price_form > 0
        query << "features -> 'price' >= ?"
        conditions << price_form.inspect
      end
      if price_to > 0
        query << "features -> 'price' <= ?"
        conditions << price_to.inspect
      end
      other_attributes = %w(hot recommend event promotion discount)
      other_attributes.each do |attr|
        if params[:search][attr] == '1'
          query << "features ->> '" + attr + "' like ?"
          conditions << "1"
        end
      end
      conditions.unshift query.join(' and ')
      @products = @site.products.where(conditions)
      if params[:search][:catalog_id].present?
        catalog_id = params[:search][:catalog_id]
      end
    end
    if params[:catalog].present?
      catalog_id = params[:catalog]
    end
    catalog = ProductCatalog.where(id: catalog_id).first
    @products = @products.where(catalog_id: catalog.self_and_descendant_ids) if catalog
    if params[:reorder].present?
      @products = case params[:reorder]
      # when 'clicks'
      #   @products.order(price: :asc)
      when 'newest'
        @products.order(created_at: :desc)
      # when 'discount'
      #   @products.order(price: :asc)
      when 'price'
        @products.order("features -> 'discount' desc")
      else
        @products
      end
    end
    @products = @products.page(params[:page]).per(9)
    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end

  def show
    authorize @product
    @catalog_ancestors = []
    if @product.catalog.present?
      @catalog_ancestors.push(@product.catalog)
      if @product.catalog.parent
        @catalog_ancestors = (@catalog_ancestors + @product.catalog.ancestors).reverse
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    authorize Product
    @product = Product.new
  end

  def edit
    authorize @product
  end

  def create
    @product = Product.new(permitted_attributes(Product))
    @product.site = @site
    authorize @product
    filter_additional_attribute
    if @product.save
      # redirect_to agent_product_path(@product), notice: 'Product 创建成功.'
      render json: {url: agent_product_path(@product)}
    else
      render json: {errors: @product.errors.full_messages.join(',')}
    end
  end

  def update
    authorize @product
    filter_additional_attribute
    if @product.update(permitted_attributes(@product))
      redirect_to agent_product_path(@product), notice: 'Product 更新成功.'
    else
      render json: {error: '名称已经被使用'}
    end
  end

  def destroy
    # authorize @product
    # @product.destroy
    # respond_to do |format|
    #   format.html { redirect_to agent_products_url, notice: 'Product 删除成功.' }
    #   format.json { head 200 }
    # end

  end

  def process_shelves
    if @product.update is_shelves: (params[:status] == '1' ? '1' : '0')
      render json: {status: 'ok'}
    end
  end

  def sales_distribution
    resource = SalesDistribution::Resource.find_or_create_by(
      type_name: '产品',
      user: current_user,
      url: agent_product_path(@product),
      object: @product
    )
    render json: {
      code: resource.code,
      share_path: URI(request.scheme + "://" + request.host + ":" + request.port.to_s).merge(resource.share_path).to_s
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @products.find(params[:id])
    end

    def set_current_user_products
      @products = @site.products
    end

    def filter_additional_attribute
      if params[:product][:additional_attribute_keys].present?
        params[:product][:additional_attribute_keys].each_pair do |k, v|
          if v.blank?
            params[:product][:additional_attribute_keys].delete(k)
            params[:product][:additional_attribute_values].delete(k)
          end
        end
      end
      if params[:product][:additional_attribute_keys].present?
        @product.additional_attribute_keys = params[:product][:additional_attribute_keys]
        @product.additional_attribute_values = params[:product][:additional_attribute_values]
      end
    end

    def set_site_tags
      @site_tags      = @site.tags.pluck(:name).uniq
      @site_most_tags = @site.tags.most_used(5).uniq.map(&:name)
    end

    def set_product_price
      if params[:product].present?
        params[:product][:price] = params[:product][:price].to_f * 100 unless params[:product][:price].blank?
        params[:product][:discount] = params[:product][:discount].to_f * 100 unless params[:product][:discount].blank?
      end
      if params[:search].present?
        params[:search][:price_from] = params[:search][:price_from].to_f * 100 unless params[:search][:price_from].blank?
        params[:search][:price_to] = params[:search][:price_to].to_f * 100 unless params[:search][:price_to].blank?
      end
    end
end
