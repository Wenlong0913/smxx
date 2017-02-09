class MarketPage < Item
  audited
  store_accessor :features, :market_template, :keywords, :description, :is_published
end
