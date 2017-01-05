class MaterialManagement
  Create =
    lambda do |attributes, user: nil|
      flag = false
      record = nil
      MaterialManagement.transaction do
        record = MaterialManagement.new(attributes)
        flag = record.save!
        record.material_management_details.each do |mod|
          material = Material.find(mod.material_id)
          if record.output?
            material.stock -= mod.number
          elsif record.input?
            material.stock += mod.number
          end
          material.save!
        end
      end
      [flag, record]
    end
end
