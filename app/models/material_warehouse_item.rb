class MaterialWarehouseItem < ApplicationRecord
  audited

  belongs_to :material
  belongs_to :material_warehouse

  # 库存变化时，更新物料总库存
  after_update -> { material.update_stock! }
end
