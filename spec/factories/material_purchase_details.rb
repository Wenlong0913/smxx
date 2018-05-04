<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: material_purchase_details
#
#  id                   :integer          not null, primary key
#  material_id          :integer
#  material_purchase_id :integer
#  number               :integer
#  input_number         :integer          default(0)
#  price                :decimal(8, 2)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  features             :jsonb
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :material_purchase_detail do
    
  end
end
