#id         | integer                     |           | not null | nextval('teachers_id_seq'::regclass)
#name       | character varying           |           |          | 
#phone      | character varying           |           |          | 
#IDcard     | character varying           |           |          | 
#email      | character varying           |           |          | 
#address    | character varying           |           |          | 
#created_at | timestamp without time zone |           | not null | 
#updated_at | timestamp without time zone |           | not null | 
#site_id    | integer                     |           |          | 

class Teacher < ApplicationRecord
  audited
  # store_accessor :features, :name, :phone, :email, :IDcard, :address
  belongs_to :site
  has_many :courses ,dependent: :destroy
  validates_presence_of :IDcard, :phone ,:name
  validates_uniqueness_of :IDcard, :phone
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  def first_image
    image_items.first.try(:image_url) || 'http://song-dev.qiniudn.com/product.jpg'
  end
end
