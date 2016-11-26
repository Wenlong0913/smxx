class UserDecorator < Draper::Decorator
  delegate_all
  delegate :phone_number, to: :mobile

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def headshot
    object.headshot || object.weixin.try(:headshot) || 'logo.png'
  end

  def display_name
    object.nickname || object.username || phone_number
  end

  def display_role
    object.roles.map(&:name).join(', ')
  end
end
