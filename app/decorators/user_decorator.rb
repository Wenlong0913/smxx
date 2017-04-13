class UserDecorator < ApplicationDecorator

  def mobile_phone
    super || mobile.try(:phone_number)
  end

  def display_headshot
    (avatar ? (Settings.site.host + object.avatar.url(:thumb)) : nil) || weixin.try(:headshot) || 'logo.png'
  end

  def display_name
    nickname.presence || username.presence || mobile.phone_number
  end

  def display_role
    roles.map(&:role_name).join(', ')
  end
end
