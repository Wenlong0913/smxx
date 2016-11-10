class Site < ApplicationRecord
  belongs_to :user
  belongs_to :theme_config, optional: true
  has_many :pages, dependent: :destroy
end
