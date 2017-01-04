class MaterialOutput
  Destroy =
    lambda do |record_or_id, user: nil|
      record = record_or_id.is_a?(MaterialOutput) ? record_or_id : MaterialOutput.find(record_or_id)
      record.destroy
    end
end
