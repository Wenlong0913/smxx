class MaterialWarehouseItem < ApplicationRecord
  audited

  belongs_to :material
  belongs_to :material_warehouse
end
