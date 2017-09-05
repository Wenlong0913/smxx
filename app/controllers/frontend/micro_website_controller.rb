class Frontend::MicroWebsiteController < Frontend::BaseController
  def index
    @wechat_index_hot_product = Product.hot(4)
    @wechat_index_hot_site = Site.hot(4)
  end

  def wechat_sites
    @sites = Site.all
    @site_catalogs = SiteCatalog.all.order(updated_at: :desc).page(params[:page])
    if params[:catalog_id]
      @site_catalog =SiteCatalog.find(params[:catalog_id])
      @sites = @site_catalog.sites
    end
    @sites = @sites.order(updated_at: :desc).page(params[:page])
  end

  def wechat_products
    @product_catalogs = ProductCatalog.all.order(updated_at: :desc)
    if params[:id].present?
      @product_catalog = ProductCatalog.find(params[:id])
      @products = @product_catalog.products
    else
      @products = Product.all
    end
    @products = @products.where("features ->> 'status' = ?", params[:type]) if %w(pending open completed closed).include?(params[:type])
    @products = @products.order(updated_at: :desc).page(params[:page])
  end

  def wechat_news
    @pages = @cms_site.channels.find_by(short_title: 'wechat').pages.order(updated_at: :desc).page(params[:page])
  end

  def wechat_new
    @page = Cms::Page.find(params[:id])
  end

  def wechat_product
    @product = Product.find(params[:id])
  end

  def wechat_site
		@site = Site.find(params[:id])
	end

end
