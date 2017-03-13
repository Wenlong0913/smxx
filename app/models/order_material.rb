class OrderMaterial < ApplicationRecord
  audited

  belongs_to :order
  belongs_to :material
  validates_presence_of :order, :material, :amount
  validates_uniqueness_of :material_id, scope: :order_id

  enum purchase_status: {
    no_need: 0, # 不需要采购 
    purchasing: 1,  #采购中,
    purchased: 2
  }

  before_validation do
    self.amount = 0 if self.amount.blank?
    self.factory_expected_number = self.amount if self.factory_expected_number.blank?
  end

  before_create do
    self.practical_number = 0
    self.purchase_status ||= 0
  end

end
