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
  validates_uniqueness_of :task_type_id, scope: [:resource]
  validates_presence_of :task_type_id

  after_initialize do
    self.status ||= 0
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.title = TaskType.where(id: self.task_type_id).first.try{name} if self.title.blank?
    self.site_id = Site::MAIN_ID
  end

end
