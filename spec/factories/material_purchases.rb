# == Schema Information
#
# Table name: material_purchases
#
#  id         :integer          not null, primary key
#  vendor_id  :integer
#  features   :jsonb
#  created_by :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#

FactoryGirl.define do
  factory :material_purchase do
    
  end
end
