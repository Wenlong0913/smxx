class Product < Item
  store_accessor :features, :price, :unit, :stock, :description, :discount, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  belongs_to :catalog
  belongs_to :site
  before_save do
    self.price = price.to_f.round(2)
    self.discount = (discount.to_f == 0 || discount.to_f > price.to_f ) ? price.to_f.round(2) : discount.to_f.round(2)
    self.weight = weight.to_f.round(2)
    self.stock = stock.to_i
  end

end
