# == Schema Information
#
# Table name: logistics
#
#  id                :integer          not null, primary key
#  order_delivery_id :integer
#  delivery_id       :integer
#  status            :integer
#  update_by         :integer
#  create_by         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :logistic do
    
  end
end
