class Ticket < ApplicationRecord
  belongs_to :site
  belongs_to :user
  belongs_to :member

  validates_presence_of :title
  validates_presence_of :site
  validates_uniqueness_of :title, scope: :site_id
end
