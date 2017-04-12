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
  has_one :active_theme_config, -> { where(active: true) }, class_name: 'ThemeConfig'
  has_many :items, dependent: :destroy
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :members, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :tags, through: :products
  has_many :orders, dependent: :destroy
  has_many :preorder_conversitions, dependent: :destroy
  has_many :market_pages, dependent: :destroy
  has_many_favorites
  has_many :deliveries, dependent: :destroy
  has_one :cms_site, class_name: '::Cms::Site', dependent: :destroy
  store_accessor :features, :description, :properties, :business_hours,
                 :recommendation, :good_summary, :bad_summary, :parking,
                 :wifi, :contact_name, :contact_phone, :has_contract, :contract_note,
                 :avg_price, :is_published, :phone, :photos, :province, :real_city, :city, :district, :business_area,
                 :lat, :lng, :updated_by
  validates_presence_of :title, :address_line#, :user_id
  validates_uniqueness_of :title, scope: [:address_line]
  acts_as_address
  audited
  validates_presence_of :title, :user_id
  validates_uniqueness_of :title, scope: [:type, :user_id]

  if Settings.project.sxhop?
    def friends
      SalesDistribution::ResourceUser.joins(:resource).
      where("sales_distribution_resources.object_type = 'Site' and sales_distribution_resources.object_id = ?", self.id).
      pluck("sales_distribution_resource_users.user_id")
    end
  end

end
