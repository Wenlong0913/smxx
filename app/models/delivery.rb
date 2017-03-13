class Delivery < Item
  audited
  store_accessor :features, :phone_number, :address
  validates_uniqueness_of :name
  validates_presence_of :name, :phone_number

  has_many :order_delivery

  after_initialize do
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.site_id = Site::MAIN_ID
  end
end
