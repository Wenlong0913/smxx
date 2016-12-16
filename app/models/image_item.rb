class ImageItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  validates_presence_of :owner, :data
  has_many :image_item_tags, dependent: :destroy
  has_many :image_item_relations, dependent: :destroy
end
