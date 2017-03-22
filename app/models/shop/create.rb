class Shop
  Create =
    lambda do |attributes, user: nil|
      record = Shop.new(attributes)
      [record.save, record]
    end
end
