class Site < ApplicationRecord
  belongs_to :user
  has_many :theme_configs
  has_one :active_theme_config, -> { where(active: true) }, class_name: 'ThemeConfig'
  has_many :pages, dependent: :destroy

  validates_presence_of :title, :user
  validates_uniqueness_of :title, scope: :user_id
end
