module Cms::ApplicationHelper

  # class="bg-blue"
  def bg_colors
    [ 'silver', 'silver-darker','silver-lighter',
      'black', 'black-darker', 'black-lighter',
      'grey', 'grey-darker', 'grey-lighter',
      'red', 'red-darker', 'red-lighter',
      'orange', 'orange-darker', 'orange-lighter',
      'green', 'green-darker', 'green-lighter',
      'yellow', 'yellow-darker', 'yellow-lighter',
      'blue', 'blue-darker', 'blue-lighter',
      'aqua', 'aqua-darker', 'aqua-lighter',
      'purple', 'purple-darker', 'purple-lighter',
    ]
  end

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
