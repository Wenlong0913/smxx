<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :order_product do
    order nil
    product nil
    amount 1
    price 1
  end
end
