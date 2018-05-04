<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :order_material do
    order nil
    material nil
    amount 1
  end
end
