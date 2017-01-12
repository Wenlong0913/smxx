class Task < ApplicationRecord
  audited

  enum status: {
    processing: 0,
    cancelled: 1,
    completed: 2
  }

  belongs_to :site
  belongs_to :task_type
  belongs_to :resource, polymorphic: true

  after_initialize do
    self.status ||= 0
  end

  belongs_to :site
  belongs_to :resource, polymorphic: true
end
