# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  features   :jsonb
#  type       :string
#

class Site < ApplicationRecord
  MAIN_ID = 1
  belongs_to :user, optional: true
  belongs_to :catalog
  has_many :theme_configs
  has_many :staffs if Settings.project.meikemei?
  has_one :active_theme_config, -> { where(active: true) }, class_name: 'ThemeConfig'
  has_many :items, dependent: :destroy
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :members, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :tags, through: :products
  has_many :orders, dependent: :destroy
  has_many :order_comments, through: :orders, source: :comments
  has_many :preorder_conversitions, dependent: :destroy
  has_many :market_pages, dependent: :destroy
  has_many_favorites
  has_many_comments
  has_many :deliveries, dependent: :destroy
  has_one :cms_site, class_name: '::Cms::Site', dependent: :destroy
  belongs_to :agent_plan, optional: true
  # store_accessor :features, :business_hours, :content, :contact_phone, :contact_name, :is_sign, :sign_note,
  # :score, :comment, :properties, :updated_by, :has_contract, :is_published, :phone, :lat, :lng
  def first_image
    image_items.first.try(:image_url) || 'http://song-dev.qiniudn.com/site.jpg'
  end

  acts_as_tree

  store_accessor :features, :description, :properties, :business_hours,
                :recommendation, :good_summary, :bad_summary, :parking,
                :wifi, :contact_name, :contact_phone, :has_contract, :contract_note,
                :avg_price, :is_published, :phone, :photos, :province, :real_city, :city, :district, :business_area,
                :updated_by, :content, :delivery_fee
  store_accessor :forage, :forage_url, :is_foraged
  
  validates_presence_of :title, :address_line#, :user_id
  validates_uniqueness_of :title, scope: [:address_line]


  if Settings.project.meikemei?
    PROPERTIES = {
      assure: "正品保障",
      cleaning: "卫生清洁",
      hidden_consumption: "无隐性消费",
      standard_procedure: "标准流程"
    }
  else
    PROPERTIES = {
      hot: "头条",
      recommend: "推荐",
      slider: "幻灯",
      scroll: "滚动",
      redirect: "跳转",
      hide: "隐藏"
    }
  end
  # Site.hot
  # Site.recommend(6)
  PROPERTIES.each_pair do |k, v|
    scope k, ->(count = 2) {
      where("(features -> 'properties') ? '#{k}'").reorder("updated_at DESC").limit(count)
    }
  end

  if Settings.project.imolin? || Settings.project.wgtong? || Settings.project.meikemei?
    acts_as_address
    acts_as_geolocated lat: 'lat', lng: 'lng'
    def address_lat
      # self.manual_geo ? self.manual_geo.lat : self.address.lat
      self.lat
    end

    def address_lng
      # self.manual_geo ? self.manual_geo.lng : self.address.lng
      self.lng
    end

    scope :published, -> { where("features ->> 'is_published' = ?", "1") }

     # site地址完成改动时候,经纬度也得跟着改
    before_save do |rec|
      if rec.address_line_changed?
        rec.lat = address.lat
        rec.lng = address.lng
      end
    end
  end
  audited

  if Settings.project.sxhop?
    def friends
      SalesDistribution::ResourceUser.joins(:resource).
      where("sales_distribution_resources.object_type = 'Site' and sales_distribution_resources.object_id = ?", self.id).
      pluck("sales_distribution_resource_users.user_id")
    end
  end

  def available_phone
    contact_phone.presence || phone.presence || user.try(:mobile).try(:phone_number)
  end

end
