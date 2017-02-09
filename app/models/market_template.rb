class MarketTemplate < ApplicationRecord
  audited
  belongs_to :catalog
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
end
