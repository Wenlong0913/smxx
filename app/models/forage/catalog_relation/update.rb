class Forage::CatalogRelation
  Update =
    lambda do |record_or_id, attributes, user: nil|
      record = record_or_id.is_a?(Forage::CatalogRelation) ? record_or_id : Forage::CatalogRelation.find(record_or_id)
      record.assign_attributes attributes
      [record.save, record]
    end
end
