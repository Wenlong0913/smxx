class UsersChatRoom < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :chat_room, class_name: 'Chat::Room'
end
