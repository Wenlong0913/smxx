class MaterialPurchaseDetail < ApplicationRecord
  audited
  belongs_to :material
  belongs_to :material_purchase
  validates :number, presence: true
  validates_numericality_of :number, :greater_than_or_equal_to => 1
end
