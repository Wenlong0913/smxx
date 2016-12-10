module CmsHelper
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
  def get_url(obj)
    if obj.class == Cms::Page
      "/cms_#{obj.channel.site.id}/#{obj.channel.short_title}/#{obj.id}"
    elsif obj.class == Cms::Channel
      "/cms_#{obj.site.id}/#{obj.short_title}"
    elsif obj.class == Cms::Site
      "/cms_#{obj.id}/"
    else
      "/"
    end
  end

end
