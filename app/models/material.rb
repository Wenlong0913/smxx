class Material < Item
  audited
  store_accessor :features, :price, :unit, :stock, :min_stock, :brand#, :note, :color, :size, :texture, :model
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :vendor_relations, as: :relation
  has_many :vendors, :through => :vendor_relations
  has_many :material_warehouse_items, dependent: :destroy
  has_many :material_warehouses, through: :material_warehouse_items
  has_many :material_stock_alerts, dependent: :destroy

  # 物料只属于本公司，不能设置为其他Site
  after_initialize do
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.site_id = Site::MAIN_ID
  end

  before_save do
    self.price = price.to_i
    self.stock = stock.to_i
  end

  def update_stock!
    update_attributes! stock: material_warehouse_items.inject(0) { |sum, mwi| sum += mwi.stock }
    MaterialStockJob.perform_async(id)
  end
end
