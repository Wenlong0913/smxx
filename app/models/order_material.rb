class OrderMaterial < ApplicationRecord
  audited
  belongs_to :order
  belongs_to :material
  validates_presence_of :order, :material, :amount
  validates_uniqueness_of :material_id, scope: :order_id

  before_create do
    if self.amount.blank?
      self.amount = 0
    end
    self.factory_expected_number = self.amount
  end

end
