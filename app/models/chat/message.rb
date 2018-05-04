# == Schema Information
#
# Table name: chat_messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chat::Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_presence_of :text, :user_id, :room_id
end
