class Produce < ApplicationRecord
  audited

  enum status: {
    processing: 0,
    cancelled: 1,
    completed: 2
  }

  belongs_to :order
  # has_many :user, as: :assignee_id
  has_many :tasks, as: :resource
  validates_uniqueness_of :order

  after_initialize do
    self.status ||= 0
  end

end
