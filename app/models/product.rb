# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  name       :string
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  name_py    :string
#  catalog_id :integer
#

class Product < Item
  audited
  store_accessor :features, :price, :image, :responsive_person, :warning_message, :service_time, :month_number, :unit, :stock,
    :description, :content, :discount, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values,
    :is_shelves, :is_fee, :shopping_fee, :hot, :recommend, :event, :promotion, :discount, :properties, :is_manager_recommend,
    :video_url, :status, :address_line1, :address_line2, :date, :time, :phone, :can_purchase, :note

  acts_as_taggable
  #store_accessor :features, :price, :unit, :stock, :description, :content, :discount, :weight, :weight_unit, :additional_attribute_keys, :additional_attribute_values, :is_shelves, :is_fee, :shopping_fee, :hot, :recommend, :event, :promotion, :discount
  validates_numericality_of :price, allow_blank: true
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :sales_distribution_resources, class_name: 'SalesDistribution::Resource', as: 'object'
  has_many_comments
  has_many_favorites
  has_many_likes
  has_many_visits
  belongs_to :catalog
  belongs_to :site

  if Settings.project.wgtong?
    PROPERTIES = {
      hot: "头条",
      recommend: "推荐",
      slider: "幻灯",
      scroll: "滚动",
      redirect: "跳转",
      hide: "隐藏"
    }
  else
    PROPERTIES = {
      recommend: "推荐",
      event: "活动",
      promotion: "促销",
      discount: "折扣"
    }
  end
  # Product.hot()
  # Product.recommend(6)
  # Product.recommend(6, catalog_id: 1)
  PROPERTIES.each_pair do |k, v|
    scope k, ->(count = 2, options = {}) {
      assoc = where("(items.features -> 'properties') ? '#{k}'").reorder("updated_at DESC").limit(count)
      if options[:catalog_id].present?
        assoc = assoc.joins(:catalog).where(catalogs: { id: options[:catalog_id] })
      end
      assoc
    }
  end

  WEIGHT_UNIT_HASH = {
    Kg: "KG(千克)",
    g: "g(克)",
    ml: "ml(毫升)",
    L: "L(升)"
  }

  #用于wgtong里的活动状态
  # product.open!
  # product.open?
  # product.status  #=> 'open'
  enum status: {
    pending: 0,     # 还未开始
    open: 1,        # 进行中
    completed: 2,   # 已满员/售完
    closed: 3       # 已结束/关闭
  }

  has_many :article_products, dependent: :destroy
  has_many :articles, :through => :article_products

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :discovers, as: :resource, dependent: :destroy
  before_save do
    self.price = price.to_f.round(2)
    self.discount = (discount.to_f == 0 || discount.to_f > price.to_f ) ? price.to_f.round(2) : discount.to_f.round(2)
    self.weight = weight.to_f.round(2)
    self.stock = stock.to_i
  end

  after_save do
    discover = self.discovers.find_or_create_by(resource: self)
    discover.save!
  end

  def sell_price
    if discount && discount < price
      discount
    else
      price
    end
  end

  def first_image
    image_items.first.try(:image_url) || 'http://song-dev.qiniudn.com/product.jpg'
  end
end
