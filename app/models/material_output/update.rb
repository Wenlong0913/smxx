class MaterialOutput
  Update =
    lambda do |record_or_id, attributes, user: nil|
      record = record_or_id.is_a?(MaterialOutput) ? record_or_id : MaterialOutput.find(record_or_id)
      material_output_details = attributes.delete(:material_output_details_attributes)
      record.assign_attributes attributes
      
      material_ids = []
      if material_output_details
        material_output_details.values.each do |mod|
          material_ids << mod["material_id"].to_i
          record_mod = record.material_output_details.find_or_create_by(material_id: mod["material_id"].to_i)
          record_mod.number = mod["number"]
        end
      end
      
      record.material_output_details.each do |record_mode|
        unless material_ids.include?(record_mode.material_id)
          record_mode.destroy
        end
      end

      [record.save, record]
    end
end
