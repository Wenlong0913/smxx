class Frontend::ProductCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
  end

  def show
    @product_catalog = ProductCatalog.find(params[:id])
    # 当前分类下已上架的所有产品
    @products = @product_catalog.products.where("features ->> 'is_shelves' = ?", '1').order(updated_at: :desc).page(params[:page])
  end

  private
    def get_catalogs
      @product_catalogs = ProductCatalog.all
    end
end
