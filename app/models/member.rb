class Member < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :site
  validates_presence_of :user, :site, :name
  validates_uniqueness_of :user_id, scope: :site_id
  validates :email, email: true, allow_blank: true
  validates :qq, qq: true, allow_blank: true
  enum gender: [ :male, :female, :secret ]
end
