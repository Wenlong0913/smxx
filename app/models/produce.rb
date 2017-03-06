class Produce < ApplicationRecord
  audited

  enum status: {
    wait_for_produce: 0, #等待处理
    processing: 1, #生产中
    completed: 2, #完成
    cancelled: 3 #取消
  }

  belongs_to :order
  has_many :tasks, as: :resource, dependent: :destroy
  validates_uniqueness_of :order

  after_initialize do
    self.status ||= 0
  end

  after_save do
    if self.completed?
      self.order.update(internal_status: 'completed')
    end
  end

end
