class Page < ApplicationRecord
  belongs_to :site, optional: true

  validates_presence_of :title
end
