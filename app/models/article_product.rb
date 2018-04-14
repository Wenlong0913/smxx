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

class ArticleProduct < ApplicationRecord
  audited
  belongs_to :article
  belongs_to :product
end
