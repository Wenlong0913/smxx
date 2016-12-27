class Order
  Create =
    lambda do |attributes, user: nil|
      record = Order.new(attributes)
      [record.save, record]
    end
end
