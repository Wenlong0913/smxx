class Frontend::SitesController < Frontend::BaseController

  def show
    @site = Site.find(params[:id])
  end
end
