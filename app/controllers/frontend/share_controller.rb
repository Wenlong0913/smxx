class Frontend::ShareController < Frontend::BaseController
  def index
    @site = Site.find_by(id: params[:site_id])
    @site_user = @site.user
  end
end
