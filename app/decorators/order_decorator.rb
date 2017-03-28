class OrderDecorator < ApplicationDecorator

  def display_internal_status
    enum_l(object, :internal_status)
  end

  def display_status
    enum_l(object, :status)
  end
end
