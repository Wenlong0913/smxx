# == Schema Information
#
# Table name: image_item_relations
#
#  id            :integer          not null, primary key
#  image_item_id :integer
#  relation_type :string
#  relation_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :image_item_relation do
    image_item nil
    relation nil
  end
end
