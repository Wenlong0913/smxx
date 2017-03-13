class OrderDecorator < ApplicationDecorator

  # def display_name
  #   h.content_tag :span, class: 'title' do
  #     name
  #   end
  # end

  # def created_at
  #   super.to_i
  # end
  def display_internal_status
    enum_l(object, :internal_status)
  end
end
