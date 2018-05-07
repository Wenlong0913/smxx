# == Schema Information
#
# Table name: material_management_details
#
#  id                     :integer          not null, primary key
#  material_id            :integer
#  material_management_id :integer
#  number                 :integer
#  price                  :decimal(8, 2)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :material_management_detail do
    material nil
    material_management nil
    number 1
    price ""
    price ""
  end
end
