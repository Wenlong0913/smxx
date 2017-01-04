class Material < Item
  audited
  store_accessor :features, :price, :unit
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  belongs_to :catalog
  # 物料只属于本公司，不能设置为其他Site
  after_initialize do
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.site_id = Site::MAIN_ID
  end

  before_save -> { self.price = price.to_i }
end
