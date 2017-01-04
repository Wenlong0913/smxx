class MaterialOutput
  Create =
    lambda do |attributes, user: nil|
      flag = false
      record = nil
      MaterialOutput.transaction do
        record = MaterialOutput.new(attributes)
        flag = record.save!
        record.material_output_details.each do |mod|
          material = Material.find(mod.material_id)
          material.stock -= mod.number
          material.save!
        end
      end
      [flag, record]
    end
end
