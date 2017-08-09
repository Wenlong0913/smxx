class Frontend::ProductCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
  end

  def show
    @product_catalog =ProductCatalog.find(params[:id])
    # 当前分类下的所有产品
    @products = @product_catalog.products
    if @products.empty?
      # 当前商家最近更新的产品
      @recent_products = Product.all.reorder(updated_at: :desc)
    end
  end

  private
  def get_catalogs
    @product_catalogs = ProductCatalog.all
  end
end
