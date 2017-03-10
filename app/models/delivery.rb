class Delivery < Item
  audited
  store_accessor :features, :phone_number, :address
  validates_uniqueness_of :name
  validates_presence_of :name, :phone_number

  has_many :order_delivery
end
