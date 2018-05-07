# == Schema Information
#
# Table name: order_materials
#
#  id                      :integer          not null, primary key
#  order_id                :integer
#  material_id             :integer
#  amount                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  factory_expected_number :integer
#  practical_number        :integer
#  purchase_status         :integer
#

FactoryGirl.define do
  factory :order_material do
    order nil
    material nil
    amount 1
  end
end
