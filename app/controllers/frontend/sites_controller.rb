class Frontend::SitesController < Frontend::BaseController
	acts_as_commentable resource: Site
  def show
    @site = Site.find(params[:id])
  end
end
