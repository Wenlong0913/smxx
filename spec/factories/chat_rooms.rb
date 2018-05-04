<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: chat_rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_type :string
#  owner_id   :integer
#  created_by :integer
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :chat_room, class: 'Chat::Room' do
    name "MyString"
  end
end
