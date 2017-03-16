# == Schema Information
#
# Table name: order_deliveries
#
#  id          :integer          not null, primary key
#  delivery_id :integer
#  order_id    :integer
#  features    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderDelivery < ApplicationRecord
  audited
  store_accessor :features, :list, :note
  belongs_to :delivery
  belongs_to :order
  validates_presence_of :delivery_id, :order_id
  validates_uniqueness_of :order_id
end
