class MaterialOutputDetail
  Create =
    lambda do |attributes, user: nil|
      record = MaterialOutputDetail.new(attributes)
      [record.save, record]
    end
end
