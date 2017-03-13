class OrderDecorator < ApplicationDecorator

  def display_internal_status
    enum_l(object, :internal_status)
  end

  # def created_at
  #   super.to_i
  # end

end
