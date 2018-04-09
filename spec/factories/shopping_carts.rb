# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :integer
#  amount     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :shopping_cart do
    product nil
    price 1
    amount 1
    user nil
  end
end
