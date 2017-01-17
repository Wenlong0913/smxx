class MaterialManagement
  Create =
    lambda do |attributes, user: nil|
      flag = false
      record = nil
      MaterialManagement.transaction do
        record = MaterialManagement.new(attributes)
        material_warehouse = MaterialWarehouse.find(attributes[:material_warehouse_id])
        if attributes["operate_type"] == 'output'
          # 检查仓库的库存是否足够
          alert_materials = []
          attributes[:material_management_details_attributes].values.each do |detail|
            material = Material.find(detail["material_id"])
            warehouse_stock = MaterialWarehouseItem.where(material: material, material_warehouse: material_warehouse).first.try{stock}.to_i
            alert_materials << material.name if warehouse_stock < detail["number"].to_i
          end
          unless alert_materials.blank?
            record.errors.add(:description, ": #{alert_materials.join(', ')}库存不足")
            return [false, record]
          end
        end
        flag = record.save!
        record.material_management_details.each do |mod|
          material = Material.find(mod.material_id)
          # 仓库中物料的库存
          material_warehouse_item = MaterialWarehouseItem.find_or_create_by(material: material, material_warehouse: material_warehouse)
          if record.output?
            material.stock -= mod.number
            material_warehouse_item.stock -= mod.number
          elsif record.input?
            material.stock += mod.number
            material_warehouse_item.stock += mod.number
          end
          material.save!
          material_warehouse_item.save!
        end
      end
      [flag, record]
    end
end
