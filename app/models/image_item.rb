class ImageItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  validates_presence_of :owner, :data
end
