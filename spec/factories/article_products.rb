<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: article_products
#
#  id         :integer          not null, primary key
#  article_id :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :article_product do
    article nil
    product nil
  end
end
