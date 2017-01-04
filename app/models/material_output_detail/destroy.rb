class MaterialOutputDetail
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(MaterialOutputDetail) ? record_or_id : MaterialOutputDetail.find(record_or_id)
      record.destroy
    end
end
