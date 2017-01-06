class MaterialManagementDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :material_management
end
