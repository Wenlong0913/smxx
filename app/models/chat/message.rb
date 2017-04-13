class Chat::Message < ApplicationRecord
  audited
  belongs_to :room
  validates_presence_of :text, :user_id, :room_id

end
