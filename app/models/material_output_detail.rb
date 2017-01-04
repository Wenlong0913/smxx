class MaterialOutputDetail < ApplicationRecord
  audited
  store_accessor :features, :material_code, :material_name
  belongs_to :material
end
