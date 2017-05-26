class Frontend::ShareController < Frontend::BaseController
  def index
    if params[:site_id].present?
      @site = Site.where(id: params[:site_id]).first
      if @site.blank?
        @share_message = @cms_site
        redirect_to frontend_path
      else
        @share_message = @site.user
      end
    else
      @share_message = @cms_site
    end
  end
end
