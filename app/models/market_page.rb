class MarketPage <  ApplicationRecord
  audited
  belongs_to :market_template
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
end
