class TaskType < ApplicationRecord
  audited
  has_many :task
end
