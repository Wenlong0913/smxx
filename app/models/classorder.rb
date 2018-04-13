class Classorder < ApplicationRecord
  audited
  belongs_to :site
  belongs_to :user
  belongs_to :course
  has_many :classorder_courses, dependent: :destroy
  has_many :courses, through: :classorder_courses
  validates_uniqueness_of :name, :scope => "user_id"  
end
