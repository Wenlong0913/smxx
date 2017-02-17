class Material < Item
  audited
  store_accessor :features, :price, :unit, :stock, :min_stock#, :note, :color, :size, :texture, :model
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :vendor_relations, as: :relation
  has_many :vendors, :through => :vendor_relations
  has_many :material_warehouse_items, dependent: :destroy
  has_many :material_warehouses, through: :material_warehouse_items
  has_many :material_stock_alerts, dependent: :destroy
  after_save :update_catalog_attributes

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

  def update_catalog_attributes
    catalog = MaterialCatalog.find(catalog_id)
    if catalog.features["settings"]
      catalog.features["settings"].each do |attr|
        attr_value = features[attr]
        if attr_value
          catalog.features[attr] ||= []
          catalog.features[attr] = catalog.features[attr].push(attr_value).uniq
        end
      end
      catalog.features['unit'] ||= []
      catalog.features['unit'] = catalog.features['unit'].push(features['unit']).uniq
      catalog.save!
    end
  end
end
