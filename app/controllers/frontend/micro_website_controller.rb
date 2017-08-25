class Frontend::MicroWebsiteController < Frontend::BaseController
  def index
  end

  def wechat_sites
    @sites = Site.all.order(updated_at: :desc).page(params[:page])
    @site_catalogs = SiteCatalog.all.order(updated_at: :ASC).page(params[:page])
    if params[:catalog_id]
      @site_catalog =SiteCatalog.find(params[:catalog_id])
      @sites = @site_catalog.sites.order(updated_at: :desc).page(params[:page])
    end
  end

  def wechat_products
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

  def wechat_product
    @product = Product.find(params[:id])
  end

  def wechat_site
		@site = Site.find(params[:id])
	end

end
