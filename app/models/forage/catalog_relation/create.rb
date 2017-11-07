class Forage::CatalogRelation
  Create =
    lambda do |attributes, user: nil|
      record = Forage::CatalogRelation.new(attributes)
      [record.save, record]
    end
end
