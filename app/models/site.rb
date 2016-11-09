class Site < ApplicationRecord
  belongs_to :user
  belongs_to :theme_config
end
