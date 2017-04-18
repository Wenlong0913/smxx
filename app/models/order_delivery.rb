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
  belongs_to :order
  has_many :logistics, dependent: :destroy
  accepts_nested_attributes_for :logistics

  validates_presence_of :order_id



end
