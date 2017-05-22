class Frontend::ProductsController < Frontend::BaseController
  def index
    # 所有产品列表
    @product = @site.products.order(updated_at: :desc)

  end

  def show
    # 当前产品详情
    @product = @site.products.find(params[:id])
    # @similar_products = Product.where(tag_list: @product.tag_list.to_s).limit(3)
  end
end
