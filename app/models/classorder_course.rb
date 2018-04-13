class ClassorderCourse < ApplicationRecord
  audited
  belongs_to :course
  belongs_to :classorder
  validates_presence_of :course#, :amount
  validates_uniqueness_of :course_id, scope: :classorder_id
end
