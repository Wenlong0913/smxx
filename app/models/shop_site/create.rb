class ShopSite
  Create =
    lambda do |attributes, user: nil|
      record = ShopSite.new(attributes)
      [record.save, record]
    end
end
