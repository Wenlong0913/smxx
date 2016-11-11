class User::Mobile < ApplicationRecord
  belongs_to :user
  validates :phone_number, presence: true, uniqueness: true
  validates_uniqueness_of :user_id
end
