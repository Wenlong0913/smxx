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

FactoryGirl.define do
  factory :chat_message, class: 'Chat::Message' do
    
  end
end
