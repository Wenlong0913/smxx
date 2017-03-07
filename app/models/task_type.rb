class TaskType < ApplicationRecord
  audited
  has_many :task
  validates_presence_of :name
end
