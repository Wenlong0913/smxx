class Theme < ApplicationRecord
  has_many :theme_configs
  has_many :sites, through: :theme_configs

  validates_presence_of :name, :display_name
  validates_uniqueness_of :name, :display_name
end
