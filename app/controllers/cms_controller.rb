class CmsController < ApplicationController
  layout 'cms'
  helper Cms::ApplicationHelper
  before_action :set_site

  #{"controller"=>"welcome", "action"=>"index", "channel"=>"fw", "id"=>"2", "tag" => "tagkey"}
  #params
  # :channel => channel.short_title
  # :id      => page.id
  # :tag     => tag
  # :title => 自定义标题
  #rules:
  # 1. a URL query must has channel except root
  # 2. If has page, the channel is page.channel, not care the params
  def index
    if params[:id]
      @page = Cms::Page.find_by(id: params[:id])
    end
    @channel = @page.channel if @page

    #short_title use for frontpage cache
    @channel ||= Cms::Channel.find_by(short_title: params[:channel])
    #channel id is not cached, use to previous
    @channel ||= Cms::Channel.find_by(id: params[:channel])

    #root index.html has no params
    @channel ||= Cms::Channel.first

    not_found if @channel.nil?
    not_found if params[:id] && @page.nil?

    if params[:search]
      @pages = Cms::Page.search(params[:search]).order("updated_at DESC").page(params[:page])
    #tag
    elsif params[:tag]
      @pages = Cms::Page.tagged_with(params[:tag]).order("updated_at DESC").page(params[:page])
    else
      @pages = Cms::Page.joins(:channel).where(["cms_channels.id = ? OR cms_channels.parent_id = ?", @channel.id, @channel.id]).order("cms_pages.updated_at DESC").page(params[:page])
    end

    #统一访问路径，使URL呈唯一性
    if @page
      if request.path != "/cms_#{@site.id}/#{@channel.short_title}/#{@page.id}"
        redirect_to "/cms_#{@site.id}/#{@channel.short_title}/#{@page.id}" and return
      end
    end
  end

  def search
    @pages = Cms::Page.search(params[:search]).order("updated_at DESC").page(params[:page])
    @channel ||= Cms::Channel.first

    #pretty URL
    if params[:utf8]
      redirect_to URI.escape "/cms_#{@site.id}/search/#{params[:search]}"
    end
  end

  private
    def set_site
      @site = Cms::Site.find(params[:site])
    end
end
