<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: material_warehouse_items
#
#  id                    :integer          not null, primary key
#  material_warehouse_id :integer
#  material_id           :integer
#  stock                 :integer          default(0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :material_warehouse_item do
    
  end
end
