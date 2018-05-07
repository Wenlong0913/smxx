# == Schema Information
#
# Table name: image_item_tags
#
#  id            :integer          not null, primary key
#  image_item_id :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :image_item_tag do
    image_item nil
    name "MyString"
  end
end
