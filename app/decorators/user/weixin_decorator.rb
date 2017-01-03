class User::WeixinDecorator < ApplicationDecorator

  def headshot
    super || 'logo.jpg'
  end

  def created_at
    super.localtime.strftime('%Y-%m-%d %H:%M:%S')
  end

  def updated_at
    super.localtime.strftime('%Y-%m-%d %H:%M:%S')
  end
end
