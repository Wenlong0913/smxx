# == Schema Information
#
# Table name: order_deliveries
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :order_delivery do
    
  end
end
