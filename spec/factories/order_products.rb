# == Schema Information
#
# Table name: order_products
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  amount     :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :order_product do
    order nil
    product nil
    amount 1
    price 1
  end
end
