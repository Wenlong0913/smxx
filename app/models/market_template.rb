class MarketTemplate < ApplicationRecord
  audited
  belongs_to :market_catalog
end
