class User::Weixin < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true, uniqueness: true
end
