class Page < ApplicationRecord
  belongs_to :site

  validates_presence_of :site, :title
end
