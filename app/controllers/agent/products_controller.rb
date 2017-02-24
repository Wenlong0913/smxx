class Agent::ProductsController < Agent::BaseController
  before_action :set_current_user_products
  before_action :set_product, only: [:show, :edit, :update, :destroy, :process_shelves]
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
      conditions.unshift query.join(' and ')
      @products = @site.products.where(conditions)
    end
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
    # authorize @product
  end

  def create
    @product = Product.new(permitted_attributes(Product))
    @product.site = current_user.sites.first
    @product.additional_attribute_keys = params["product"]["additional_attribute_keys"]
    @product.additional_attribute_values = params["product"]["additional_attribute_values"]
    authorize @product
    if @product.save
      # redirect_to agent_product_path(@product), notice: 'Product 创建成功.'
      render json: {url: agent_product_path(@product)}
    else
      render json: {errors: @product.errors.full_messages.join(',')}
    end
  end

  def update
    authorize @product
    additional_attribute
    @product.additional_attribute_keys = params["product"]["additional_attribute_keys"]
    @product.additional_attribute_values = params["product"]["additional_attribute_values"]
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @products.find(params[:id])
    end

    def set_current_user_products
      @products = @site.products
    end

    def additional_attribute
      params["product"]["additional_attribute_keys"].each_pair do |k, v|
        if v.blank?
          params["product"]["additional_attribute_keys"].delete(k)
          params["product"]["additional_attribute_values"].delete(k)
        end
      end
    end
    # Only allow a trusted parameter "white list" through.
    def product_params
      params[:product]
    end
end
