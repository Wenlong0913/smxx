class CmsController < ApplicationController
  layout 'cms'
  helper Cms::ApplicationHelper
  include Cms::ApplicationHelper
  before_action :set_site

  def index
    @channel = @cms_site.channels.first
  end

  def channel
    @channel ||= @cms_site.channels.find_by(short_title: params[:channel])
    @channel ||= @cms_site.channels.find_by(id: params[:channel])
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
    @page = @cms_site.pages.find(params[:id])
    @channel = @page.channel
    if @page && request.path != good_path=get_cms_url(@page)
      redirect_to good_path
    else
      render :index
    end
  end

  def search
    if params[:utf8]
      redirect_to cms_frontend_search_path(site: @cms_site, search: URI.escape(params[:search]))
    else
      @pages = @cms_site.pages.search(params[:search]).order("updated_at DESC").page(params[:page])
      @channel ||= @cms_site.channels.first
    end
  end

  private

  private
    def set_site
      @site = @cms_site
      not_found! if @site.nil?
    end
end
