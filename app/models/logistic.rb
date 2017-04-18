class Logistic < ApplicationRecord
  audited
  enum status: {
    in_transit: 0,   # 运输中
    completed: 1,   # 已到达
  }

  belongs_to :order_delivery
  belongs_to :delivery

  validates_presence_of :delivery_id

  before_save do
    if self.status.blank?
      self.status = 0
    end
  end
end
