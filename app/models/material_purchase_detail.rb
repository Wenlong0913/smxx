class MaterialPurchaseDetail < ApplicationRecord
  belongs_to :material
  belongs_to :material_purchase
  audited associated_with: :material_purchase
  store_accessor :features, :order_code
  validates :number, presence: true
  validates_numericality_of :number, :greater_than_or_equal_to => 1
end
