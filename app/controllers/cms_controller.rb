class CmsController < ApplicationController
  layout 'cms'
  helper Cms::ApplicationHelper
  include Cms::ApplicationHelper
  before_action :set_site

  def index
    @channel = @site.channels.first
  end

  def channel
    @channel ||= @site.channels.find_by(short_title: params[:channel])
    @channel ||= @site.channels.find_by(id: params[:channel])
    @channel || not_found!
    @channel
    @pages = @channel.pages.page(params[:page])
    if request.path != good_path=get_cms_url(@channel, page: params[:page])
      redirect_to good_path
    else
      render :index
    end
  end

  def page
    @page = @site.pages.find(params[:id])
    @channel = @page.channel
    if @page && request.path != good_path=get_cms_url(@page)
      redirect_to good_path
    else
      render :index
    end
  end

  def search
    if params[:utf8]
      redirect_to cms_frontend_search_path(site: @site, search: URI.escape(params[:search]))
    else
      @pages = @site.pages.search(params[:search]).order("updated_at DESC").page(params[:page])
      @channel ||= @site.channels.first
    end
  end

  private

  private
    def set_site
      @site = Cms::Site.find(params[:site])
    end
end
