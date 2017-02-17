class Ticket < ApplicationRecord
  belongs_to :site
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :site
  validates_presence_of :user
 
end
