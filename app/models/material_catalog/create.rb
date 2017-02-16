class MaterialCatalog
  Create =
    lambda do |attributes, user: nil|
      attributes["settings"] = attributes["settings"].split(/[,，]/).map(&:strip) if attributes["settings"].present?
      record = MaterialCatalog.new(attributes)
      [record.save, record]
    end
end
