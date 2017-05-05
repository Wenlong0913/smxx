module ApplicationHelper
  # Check current page by route paths
  # == Usage
  #  page?('admin/products') => check controller path is 'admin/products'
  #  page?('admin/products#index') => check controller path is 'admin/products' and action_name is 'index'
  #  page?('admin/products#show?id=1') => check controller_path is 'admin/products', action_name is 'show' and id is 1
  #
  # @param *paths [Array] route path
  # @return True or False
  def page?(*paths)
    !!paths.find do |path|
      others, _args = path.split('?')
      _controller, _action = others.split('#')

      flag = true
      flag = false if _args && !_args.split('&').all? { |arg| k, v = arg.split('='); params[k].to_s == v.to_s }
      flag = false if _action && action_name != _action
      flag = false if _controller != controller_path
      flag = true if path == request.fullpath
      flag
    end
  end

  # get random img use in login interface or banner
  # == Usage
  #  image_tag(rand_banner_img)
  def rand_banner_img
    [
      'http://song-dev.qiniudn.com/g0.jpg',
      'http://song-dev.qiniudn.com/g1.jpg',
      'http://song-dev.qiniudn.com/g2.jpg',
      'http://song-dev.qiniudn.com/g3.jpg',
      'http://song-dev.qiniudn.com/g4.jpg',
      'http://song-dev.qiniudn.com/g5.jpg',
      'http://song-dev.qiniudn.com/g6.jpg'
    ].sample
  end

  # class="bg-blue"
  def rand_bg_color
    [ 'silver', 'silver-darker',
      'black', 'black-darker',
      'grey', 'grey-darker',
      'red', 'red-darker', 'red-lighter',
      'orange', 'orange-darker', 'orange-lighter',
      'green', 'green-darker', 'green-lighter',
      'yellow', 'yellow-darker',
      'blue', 'blue-darker', 'blue-lighter',
      'aqua', 'aqua-darker', 'aqua-lighter',
      'purple', 'purple-darker', 'purple-lighter',
    ].sample
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
