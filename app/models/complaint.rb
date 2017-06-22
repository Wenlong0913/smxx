class Complaint < ApplicationRecord
  audited

  belongs_to :user
  belongs_to :source, polymorphic: true

  validates_presence_of :source, :user, :content
end
