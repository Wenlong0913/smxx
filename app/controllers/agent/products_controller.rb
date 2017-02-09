class Agent::ProductsController < Agent::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    authorize Product
    @products = @site.products
    @catalogs = ProductCatalog.roots
    if params[:reorder].present?
      @products = case params[:reorder]
      # when 'clicks'
      #   @products.order(price: :asc)
      when 'newest'
        @products.order(created_at: :desc)
      # when 'discount'
      #   @products.order(price: :asc)
      when 'price'
        @products.order("features -> 'price' desc")
      else
        @products
      end
    end
    @products = @products.page(params[:page])
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
    @product.site = @site.id
    authorize @product
    if @product.save
      # redirect_to agent_product_path(@product), notice: 'Product 创建成功.'
      render json: {url: agent_product_path(@product)}
    else
      render :new
    end

  end

  def update
    authorize @product
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @products.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params[:product]
    end
end
