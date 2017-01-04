class MaterialOutput
  Create =
    lambda do |attributes, user: nil|
      record = MaterialOutput.new(attributes)
      [record.save, record]
    end
end
