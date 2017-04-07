class ProductCatalog
  Create =
    lambda do |attributes, user: nil|
      if attributes["settings"].blank?
        attributes["settings"] = nil
      else
        attributes["settings"] = attributes["settings"].split(/[,，]/).map(&:strip)
      end
      record = ProductCatalog.new(attributes)
      [record.save, record]
    end
end
