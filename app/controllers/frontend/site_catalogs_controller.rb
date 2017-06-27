class Frontend::SiteCatalogsController < Frontend::BaseController
  before_action :get_catalogs

  def index
    @site_catalogs = SiteCatalog.all
  end

  def show
    @site_catalog =SiteCatalog.find(params[:id])
    # 当前分类下的所有场馆
    @sites  = Site.where(catalog: params[:id]).order(updated_at: :desc).page(params[:page])
  end

  private
  def get_catalogs
    @site_catalogs = SiteCatalog.all
  end
end
