class Article < ApplicationRecord
  audited
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  has_many :article_products, dependent: :destroy
  has_many :products, :through => :article_products 
  has_many :discovers, as: :resource, dependent: :destroy
  belongs_to :user, foreign_key: :author, class_name: 'User'
  acts_as_taggable
  after_save do
    discover = self.discovers.find_or_create_by(resource: self)
    discover.save!
  end
end
