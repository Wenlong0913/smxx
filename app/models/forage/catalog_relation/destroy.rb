class Forage::CatalogRelation
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(Forage::CatalogRelation) ? record_or_id : Forage::CatalogRelation.find(record_or_id)
      record.destroy
    end
end
