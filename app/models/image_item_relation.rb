class ImageItemRelation < ApplicationRecord
  audited

  belongs_to :image_item
  belongs_to :relation, polymorphic: true
end
