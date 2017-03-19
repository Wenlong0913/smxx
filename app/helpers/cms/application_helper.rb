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

end
