# id           | integer                     |           | not null | nextval('courses_id_seq'::regclass)
#name         | character varying           |           |          | 
#course_type         | character varying           |           |          | 
#introduction | text                        |           |          | 
#created_at   | timestamp without time zone |           | not null | 
#updated_at   | timestamp without time zone |           | not null | 
#site_id      | integer                     |           |          | 
#features     | jsonb                       |           |          | 
#teacher_id   | integer                     |           |          | 

class Course < ApplicationRecord
  audited
  store_accessor :features,:limit_number ,:age_range,:sex_limit, :class_week,:class_time,
  :selected_number,:class_place,:class_level,:teacher_name,:class_day
  belongs_to :site, optional: true
  belongs_to :teacher
  has_many :classorder_courses, dependent: :destroy 
  has_many :classorders, through: :classorder_courses 

  validates_presence_of :teacher_name,:class_level,:name,:course_type#,:class_week,:class_time,:class_day
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :discovers, as: :resource, dependent: :destroy
  
  # validates_uniqueness_of 
  def first_image
    image_items.first.try(:image_url) || 'http://song-dev.qiniudn.com/product.jpg'
  end
end
