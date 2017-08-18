class Frontend::ProductCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
  end

  def show
    @product_catalog = ProductCatalog.find(params[:id])
    # 当前分类下的所有产品
    @products = @product_catalog.products.page(params[:page])
  end
  # 微信公众号使用
  def wechat_products
    # 文体娱乐
    # @product_catalog = ProductCatalog.find(params[:id])
    if params[:id]
      @product_catalog = ProductCatalog.find(params[:id])
      @products = @product_catalog.products.page(params[:page])
    else
      @products = Product.all.page(params[:page])
    end





    if params[:type] == 'pending'
      @products = Product.where("features ->> 'status' = ?", 'pending').page(params[:page])
    end

    if params[:type] == 'open'
      @products = Product.where("features ->> 'status' = ?", 'open').page(params[:page])
    end

    if params[:type] == 'completed'
      @products = Product.where("features ->> 'status' = ?", 'completed').page(params[:page])
    end

    if params[:type] == 'closed'
      @products = Product.where("features ->> 'status' = ?", 'closed').page(params[:page])
    end

  end
  private
  def get_catalogs
    @product_catalogs = ProductCatalog.all
  end
end
