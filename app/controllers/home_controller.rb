class HomeController < ApplicationController
  acts_as_trackable only: :index
  def index
    if @site
      return redirect_to cms_frontend_root_path(site: @site.id)
    end
  end

end
