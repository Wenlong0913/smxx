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
  belongs_to :user
  has_many :theme_configs
  has_many :staff
  has_one :active_theme_config, -> { where(active: true) }, class_name: 'ThemeConfig'
  has_many :items, dependent: :destroy
  has_many :image_items, dependent: :destroy, as: :owner
  has_many :members, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :preorder_conversitions, dependent: :destroy
  has_many :market_pages, dependent: :destroy
  has_many_favorites
  has_many :deliveries, dependent: :destroy
  has_one :cms_site, class_name: '::Cms::Site', dependent: :destroy
  store_accessor :features, :site_hours, :content, :contact_number, :contact_name, :is_sign, :comment, :properties

  acts_as_address

  validates_presence_of :title, :user_id
  validates_uniqueness_of :title, scope: [:type, :user_id]

  PROPERTIES = {
    assure: "正品保障",
    cleaning: "卫生清洁",
    hidden_consumption: "无隐性消费",
    standard_procedure: "标准流程"
  }

end
