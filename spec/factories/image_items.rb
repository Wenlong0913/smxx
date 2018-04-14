# == Schema Information
#
# Table name: image_items
#
#  id         :integer          not null, primary key
#  owner_type :string
#  owner_id   :integer
#  name       :string
#  file_size  :integer
#  width      :integer
#  height     :integer
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :image_item do
    owner nil
    name "MyString"
    file_size 1
    width 1
    height 1
    data ""
  end
end
