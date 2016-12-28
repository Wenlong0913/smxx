class OrderProduct < ApplicationRecord
  audited
  belongs_to :order
  belongs_to :product
  validates_presence_of :order, :amount
  validates_uniqueness_of :product_id, scope: :order_id

  before_create :set_default_price

  private

  def set_default_price
    self.price ||= product.price * amount
  end
end
