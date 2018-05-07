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

FactoryGirl.define do
  factory :chat_room, class: 'Chat::Room' do
    name "MyString"
  end
end
