class Frontend::SiteCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
  end

  def show
    @site_catalog =SiteCatalog.find(params[:id])
    # 当前分类下的所有场馆
    @sites = @site_catalog.sites.order(updated_at: :desc).page(params[:page])
    if @sites.empty?
      # 平台中最新近更新商家列表
      @recent_sites = Site.all.reorder(updated_at: :desc)
    end
  end

  private

  def get_catalogs
    @site_catalogs = SiteCatalog.all
  end

end
