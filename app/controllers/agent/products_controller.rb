class Agent::ProductsController < Agent::BaseController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    # authorize Product
    # @products = Product.all.page(params[:page])
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @products }
    # end
  end

  def show
    # authorize @product
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @product }
    # end
  end

  def new
    # authorize Product
    # @product = Product.new(product_params)
  end

  def edit
    # authorize @product
  end

  def create
    # authorize Product
    # @product = Product.new(permitted_attributes(Product)))
    #
    # respond_to do |format|
    #   format.html do
    #     if @product.save
    #       redirect_to agent_product_path(@product), notice: 'Product 创建成功.'
    #     else
    #       render :new
    #     end
    #   end
    #   format.json { render json: @product }
    # end

  end

  def update
    # authorize @product
    # respond_to do |format|
    #   format.html do
    #     if @product.update(permitted_attributes(@product))
    #       redirect_to agent_product_path(@product), notice: 'Product 更新成功.'
    #     else
    #       render :edit
    #     end
    #   end
    #   format.json { render json: @product }
    # end
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
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params[:product]
    end
end
