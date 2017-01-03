class OrderMaterial < ApplicationRecord
  audited
  belongs_to :order
  belongs_to :material
  validates_presence_of :order, :material, :amount
  validates_uniqueness_of :order_id, :material_id
end
