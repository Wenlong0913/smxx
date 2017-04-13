class Chat::Room < ApplicationRecord
  audited
  has_many :messages, dependent: :destroy
end
