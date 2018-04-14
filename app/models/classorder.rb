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
end
