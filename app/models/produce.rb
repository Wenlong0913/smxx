class Produce < ApplicationRecord
  audited

  enum status: {
    processing: 0,
    cancelled: 1,
    completed: 2,
    wait_for_task: 3
  }

  belongs_to :order
  has_many :tasks, as: :resource
  validates_uniqueness_of :order

  after_initialize do
    self.status ||= 3
  end

end
