class UserDecorator < ApplicationDecorator
  def display_headshot
    headshot || weixin.try(:headshot) || 'logo.png'
  end

  def display_name
    nickname.presence || username.presence || mobile.phone_number
  end

  def display_role
    roles.map(&:role_name).join(', ')
  end
end
