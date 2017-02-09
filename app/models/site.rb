# == Schema Information
#
# Table name: sites
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Site < ApplicationRecord
  MAIN_ID = 1
  belongs_to :user
  has_many :theme_configs
  has_one :active_theme_config, -> { where(active: true) }, class_name: 'ThemeConfig'
  has_many :items, dependent: :destroy
  has_many :image_items, dependent: :destroy, as: :owner
  has_many :members, dependent: :destroy
  has_many :products
  store_accessor :features, :description
  validates_presence_of :title, :user_id
  validates_uniqueness_of :title, scope: [:type, :user_id]
end
