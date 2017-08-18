class Frontend::SiteCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
  end

  def show
    @site_catalog =SiteCatalog.find(params[:id])
    # 当前分类下的所有场馆
    @sites = @site_catalog.sites.order(updated_at: :desc).page(params[:page])
  end

  # 微信公众号使用
  def wechat_sites
    # @site_catalog = SiteCatalog.find(params[:id])
    @sites = Site.all.order(updated_at: :desc).page(params[:page])
    @site_catalogs = SiteCatalog.all.order(updated_at: :ASC).page(params[:page])

    if params[:catalog_id]
      @site_catalog =SiteCatalog.find(params[:catalog_id])
      @sites = @site_catalog.sites.order(updated_at: :desc).page(params[:page])
    end

  end

  private

  def get_catalogs
    @site_catalogs = SiteCatalog.all
  end

end
