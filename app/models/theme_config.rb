class ThemeConfig < ApplicationRecord
  belongs_to :site
  belongs_to :theme

  validates_uniqueness_of :theme_id, scope: :site_id
end
