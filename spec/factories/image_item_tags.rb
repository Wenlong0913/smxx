<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :image_item_tag do
    image_item nil
    name "MyString"
  end
end
