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
    case obj
    when Cms::Page
      cms_frontend_page_path(obj.site.beauty_url, obj.channel.beauty_url, obj.beauty_url, params)
    when Cms::Channel
      cms_frontend_channel_path(obj.site.beauty_url, obj.beauty_url, params)
    when Cms::Site
      cms_frontend_root_path(obj.beauty_url, params)
    when String
      obj = Cms::Channel.find_by(short_title: obj)
      return root_path(params) unless obj.present?
      cms_frontend_channel_path(obj.site.beauty_url, obj.beauty_url, params)
    else
      root_path(params)
    end
  end

end
