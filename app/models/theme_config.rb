class ThemeConfig < ApplicationRecord
  belongs_to :site
  belongs_to :theme

  validates_uniqueness_of :site
end
