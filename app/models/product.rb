class Product < Item
  store_accessor :features, :price, :unit
  validates_numericality_of :price, allow_blank: true

  before_save -> { self.price = price.to_i }
end
