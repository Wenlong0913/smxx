class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    authorize Product
    @products = Product.all.page(params[:page])
  end

  # GET /admin/products/1
  def show
    authorize @product
  end

  # GET /admin/products/new
  def new
    authorize Product
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
    authorize @product
  end

  # POST /admin/products
  def create
    authorize Product
    @product = Product.new(permitted_attributes(Product))

    if @product.save
      redirect_to admin_product_path(@product), notice: 'Product 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    authorize @product
    if @product.update(permitted_attributes(@product))
      redirect_to admin_product_path(@product), notice: 'Product 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    authorize @product
    @product.destroy
    redirect_to admin_products_url, notice: 'Product 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_product_params
    #       #   params.require(:admin_product).permit(policy(@admin_product).permitted_attributes)
    #       # end
end
