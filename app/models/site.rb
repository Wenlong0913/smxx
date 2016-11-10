class Site < ApplicationRecord
  belongs_to :user
  belongs_to :theme_config, optional: true
  has_many :pages, dependent: :destroy

  validates_presence_of :title, :user
  validates_uniqueness_of :title, scope: :user
end
