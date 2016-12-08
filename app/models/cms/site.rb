class Cms::Site < ApplicationRecord
  has_many :channels, dependent: :destroy
end
