class Classorder < ApplicationRecord
  audited
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  belongs_to :user
  belongs_to :site
  # belongs_to :course
  has_many :classorder_courses, dependent: :destroy
  has_many :courses, through: :classorder_courses
  validates_uniqueness_of :name, :scope => "user_id"

  before_validation do
    @course = Course.find(self.course_id)
    remainder = @course.features["limit_number"][self.features]
    errors.add :limit_number, '名额已满，请选择其他课程' unless remainder && remainder.to_i > 0
  end

end
