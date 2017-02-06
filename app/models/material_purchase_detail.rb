class MaterialPurchaseDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :material_purchase
end
