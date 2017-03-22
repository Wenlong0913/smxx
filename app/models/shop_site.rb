class ShopSite < ApplicationRecord
  audited
  belongs_to :shop
  belongs_to :site
end
