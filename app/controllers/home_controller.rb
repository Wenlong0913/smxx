class HomeController < ApplicationController
  acts_as_trackable only: :index
  def index
    #首页跳转的CMS
    if @cms_site
      return redirect_to cms_frontend_root_path(site: @cms_site.id)
    end
  end

end
