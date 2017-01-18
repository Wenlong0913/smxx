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
  validates_uniqueness_of :task_type_id, scope: [:resource_type, :resource_id]
  validates_presence_of :task_type_id, :site_id, :creator_id, :title

  after_initialize do
    self.status ||= 0
    self.site_id = Site::MAIN_ID
  end

  before_validation do
    self.title = task_type.name if self.title.blank? && task_type
    self.site_id = Site::MAIN_ID
  end

end
