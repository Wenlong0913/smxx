class MaterialOutput
  Update =
    lambda do |record_or_id, attributes, user: nil|
      record = record_or_id.is_a?(MaterialOutput) ? record_or_id : MaterialOutput.find(record_or_id)
      material_output_details = attributes.delete(:material_output_details_attributes)
      record.assign_attributes attributes

      [record.save, record]
    end
end
