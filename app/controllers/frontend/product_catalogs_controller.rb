class Frontend::ProductCatalogsController < Frontend::BaseController
  def index
    @product_catalogs = ProductCatalog.all
  end

  def show
    @product_catalog = @site.ProductCatalog.find(params[:id])
    # 当前分类下的所有产品
    @products  = @site.products.where(catalog: params[:id]).order(updated_at: :desc).all
  end
end
