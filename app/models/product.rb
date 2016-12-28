class Product < Item
  store_accessor :features, :price, :unit
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  belongs_to :catalog
  
  before_save -> { self.price = price.to_i }
end
