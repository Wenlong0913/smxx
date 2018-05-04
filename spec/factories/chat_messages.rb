<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :chat_message, class: 'Chat::Message' do
    
  end
end
