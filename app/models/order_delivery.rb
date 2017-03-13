class OrderDelivery < ApplicationRecord
  audited
  belongs_to :delivery
  belongs_to :order
  validates_presence_of :delivery_id, :order_id
end
