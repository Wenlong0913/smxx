class Frontend::SitesController < Frontend::BaseController
	acts_as_commentable resource: Site
  impressionist :actions=>[:show]

  def show
    @site = Site.find(params[:id])
    @comment_path = comments_frontend_site_path(@site)
  end
  
end
