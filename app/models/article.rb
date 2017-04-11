class Article < ApplicationRecord
  audited
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :article_products
  has_many :products, :through => :article_products 
end
