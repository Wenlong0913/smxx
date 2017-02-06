class MaterialPurchase < ApplicationRecord
  audited
  belongs_to :vendor
  store_accessor :features, :purchase_date, :delivery_date, :amount, :paid, :total, :note
  has_many :material_purchase_details, dependent: :destroy
  accepts_nested_attributes_for :material_purchase_details

  enum status: {
    checking: 0, # 审核
    storage: 1,  # 入库
    paying: 2,   # 付款
  }
end
