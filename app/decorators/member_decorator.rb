class MemberDecorator < Decorator::Base

  def display_gender
    case gender
    when 'male'
      '男'
    when 'female'
      '女'
    when 'secret'
      '保密'
    end
  end
  # def display_name
  #   h.content_tag :span, class: 'title' do
  #     name
  #   end
  # end

  # def created_at
  #   super.to_i
  # end

end
