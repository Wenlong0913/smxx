class CmsController < ApplicationController
  layout 'cms'
  helper Cms::ApplicationHelper
  include Cms::ApplicationHelper
  before_action :check_subdomain!

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
    #page first, then channel ?
    if params[:id]
      @page = Cms::Page.joins(:channel).where("cms_channels.site_id = ? and cms_pages.id = ?", @cms_site.id, params[:id]).first
    end
    @channel = @page.channel if @page
    @channel ||= @cms_site.channels.find_by(short_title: params[:channel])
    @channel ||= @cms_site.channels.find_by(id: params[:channel])

    #root index.html has no params
    if params.delete_if {|k, v| ['controller', 'action', 'from', 'isappinstalled', 'utm_source'].include?(k)}.empty?
      @channel ||= @cms_site.channels.first
    end

    not_found! if @channel.nil?
    not_found! if params[:id] && @page.nil?

    if params[:search]
      @pages = Cms::Page.search(@cms_site.id, params[:search]).order("updated_at DESC").page(params[:page])
    elsif params[:tag]
      @pages = Cms::Page.tagged_with(params[:tag]).order("updated_at DESC").page(params[:page])
    else
      @pages = Cms::Page.joins(:channel).where(["cms_channels.site_id = ? AND (cms_channels.id = ? OR cms_channels.parent_id = ?)", @cms_site.id, @channel.id, @channel.id]).order("cms_pages.updated_at DESC").page(params[:page]).per(6)
    end
    #tag cloud
    #@tags = Cms::Page.tag_counts_on(:tags)

    #comment

    #统一访问路径，使URL呈唯一性
    # if @page
    #   #impressionist(@page, "page_#{@page.id}") # 2nd argument is optional
    #   if request.path != "/#{@channel.short_title}/#{@page.id}"
    #     redirect_to "/cms/#{@channel.short_title}/#{@page.id}" and return
    #   end
    # end

    #实现自定义标题, 前台通过传递参数获得
    @title = params[:title] if params[:title].present?

    #统计channel
    impressionist(@channel, "channel_#{@channel.id}")
    impressionist(@page, "page_#{@page.id}") if @page # 2nd argument is optional

    #respond_with @page || @channel
    respond_to do |format|
      format.html
      format.js
    end

  end

  def search
    @pages = Cms::Page.search(@cms_site.id, params[:search]).order("updated_at DESC").page(params[:page])
    @channel ||= Cms::Channel.first
    #comment
    #tag cloud
    #@tags = Cms::Page.tag_counts_on(:tags)
    #pretty URL
    if params[:utf8]
      redirect_to URI.escape "/cms/search/#{params[:search]}"
    end
  end

  def tag
    @pages = Cms::Page.tagged_with(params[:tag]).order("updated_at DESC").page(params[:page])
    @channel ||= Cms::Channel.first

    #comment
  end

  private

  def check_subdomain!
    @cms_site = Cms::Site.find_by(domain: request.subdomain)
    redirect_to root_url(subdomain: nil) if @cms_site.nil? || !@cms_site.is_published
  end
end
