class Catalog
  Create =
    lambda do |attributes, user: nil|
      attributes["settings"] = attributes["settings"].split(/[,，]/).map(&:strip) if attributes["settings"].present?
      record = Catalog.new(attributes)
      [record.save, record]
    end
end
