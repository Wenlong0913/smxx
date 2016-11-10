class Site < ApplicationRecord
  belongs_to :user
  belongs_to :theme_config
  has_many :pages, dependent: :destroy

  validates_presence_of :theme_config, :title, :user
  validates_uniqueness_of :user
end
