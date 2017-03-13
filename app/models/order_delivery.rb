class OrderDelivery < ApplicationRecord
  audited
  store_accessor :features, :list
  belongs_to :delivery
  belongs_to :order
  validates_presence_of :delivery_id, :order_id
  validates_uniqueness_of :order_id
end
