class User::Mobile < ApplicationRecord
  belongs_to :user
  validates :user, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true, case_sensitive: false
end
