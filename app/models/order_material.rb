class OrderMaterial < ApplicationRecord
  audited

  belongs_to :order
  belongs_to :material
  validates_presence_of :order, :material, :amount
  validates_uniqueness_of :material_id, scope: :order_id

  before_validation do
    self.amount = 0 if self.amount.blank?
    self.factory_expected_number = self.amount if self.factory_expected_number.blank?
  end

end
