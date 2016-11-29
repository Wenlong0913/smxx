
class Admin::ProductsController < Admin::BaseController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    authorize Product
    @admin_products = Product.all
  end

  # GET /admin/products/1
  def show
    authorize @admin_product
  end

  # GET /admin/products/new
  def new
    authorize Product
    @admin_product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
    authorize @admin_product
  end

  # POST /admin/products
  def create
    authorize Product
    @admin_product = Product.new(permitted_attributes(@admin_product))

    if @admin_product.save
      redirect_to admin_product_path(@admin_product), notice: 'Product 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    authorize @admin_product
    if @admin_product.update(permitted_attributes(@admin_product))
      redirect_to admin_product_path(@admin_product), notice: 'Product 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    authorize @admin_product
    @admin_product.destroy
    redirect_to admin_products_url, notice: 'Product 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_product_params
    #       #   params.require(:admin_product).permit(policy(@admin_product).permitted_attributes)
    #       # end
end
