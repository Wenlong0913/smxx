class User::WeixinDecorator < ApplicationDecorator

  def display_headshot
    headshot || 'logo.jpg'
  end

  def display_created_at
    created_at.localtime.strftime('%Y-%m-%d %H:%M:%S')
  end

  def display_updated_at
    updated_at.localtime.strftime('%Y-%m-%d %H:%M:%S')
  end
end
