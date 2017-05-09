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
  if Settings.project.sxhop?
    store_accessor :features, :logistics_name, :logistics_number
  elsif Settings.project.imolin?
    store_accessor :features, :delivery_username, :delivery_phone, :delivery_address
  else
    store_accessor :features, :list, :note
  end
  belongs_to :order
  has_many :logistics, dependent: :destroy
  accepts_nested_attributes_for :logistics

  validates_presence_of :order

  if Settings.project.imolin?
    after_save :update_user_address_book
  end

  def update_user_address_book
    user = order.user
    address_book = user.address_book || user.build_address_book
    address_book.name = self.delivery_username
    address_book.mobile_phone = self.delivery_phone
    address_book.full_address = self.delivery_address
    address_book.city = ''
    address_book.street = ''
    address_book.save!
  end

end
