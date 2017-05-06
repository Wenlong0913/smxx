module Cms::ApplicationHelper
  def meta_title(page_title)
    content_for(:title){ page_title}
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
    content_for(:meta_description){ meta_description}
  end
  def cms_content(item_content)
    content_for(:content){ raw item_content }
  end

  ################################################
  #############helper for cms frontend ####################
  #
  def get_date(date)
    date.strftime("%Y-%m-%d")
  end

  #use for Frontpage: get production frontpage path
  # get_cms_url(obj)
  # get_cms_url('short_title')
  def get_cms_url(obj, params = {})
    prefix = cms_frontend_root_url(params)
    case obj
    when Cms::Page
      prefix.concat("#{obj.channel.short_title}/#{obj.id}")
    when Cms::Channel
      prefix.concat("#{obj.short_title}")
    when String
      prefix.concat("#{obj}")
    else
      prefix
    end
  end

  #获得obj的上一个对象
  def get_prev_obj(obj)
    the_obj = case obj.class.to_s
    when "Cms::Page"
      Cms::Page.order("id desc").where("id < ?", obj.id).limit(1).first
    when "Cms::Channel"
      Cms::Channel.order("id desc").where("id < ?", obj.id).limit(1).first
    end
    return the_obj.nil? ? obj : the_obj
  end
  #获得obj的下一个对象
  def get_next_obj(obj)
    the_obj = case obj.class.to_s
    when "Cms::Page"
      Cms::Page.where("id > ?", obj.id).limit(1).first
    when "Cms::Channel"
      Cms::Channel.where("id > ?", obj.id).limit(1).first
    end
    return the_obj.nil? ?  obj : the_obj
  end

  #前台获得下拉列表菜单
  #默认调用方法：get_menu('product')
  #level: 显示的层级深度，默认为2级；如果要显示3级，则调用：get_menu('product', 3)
  def get_menu(channel_title_or_short_title, level = 1)
    parent_channel = Cms::Channel.find_by(short_title: channel_title_or_short_title)
    parent_channel ||= Cms::Channel.find_by(title: channel_title_or_short_title)
    return if parent_channel.nil?
    if parent_channel.children.any? && (level = level - 1) >= 0
      str_arr = []
      str_arr << %{<li class="dropdown">}
      if mobile_device?
      str_arr << %{<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> #{parent_channel.title} <b class="caret"></b></a>}
      else
        str_arr << %{<a class="dropdown-toggle"  href="#{get_cms_url(parent_channel)}"> #{parent_channel.title} <b class="caret"></b></a>}
      end
      str_arr << %{<ul class="dropdown-menu">}
      parent_channel.children.each do |ch|
        str_arr << get_menu(ch.short_title, level - 1)
      end
      str_arr << %{</ul></li>}
      str_arr.join("\n").html_safe
    else
      %{<li><a href="#{get_cms_url(parent_channel)}">#{parent_channel.title}</a></li>}.html_safe
    end
  end


end
