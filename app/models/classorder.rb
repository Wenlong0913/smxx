class Classorder < ApplicationRecord
  audited
  validates_uniqueness_of :name
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  belongs_to :user
  belongs_to :site
end
