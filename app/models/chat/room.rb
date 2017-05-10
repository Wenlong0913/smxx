class Chat::Room < ApplicationRecord
  audited
  has_many :messages, dependent: :destroy
  belongs_to :owner, polymorphic: true
end
