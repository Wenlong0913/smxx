class Page < ApplicationRecord
  belongs_to :site

  validates_presence_of :title
end
