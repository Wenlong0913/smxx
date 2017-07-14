require 'rails_helper'

RSpec.describe UsersChatRoom::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:users_chat_room)
    flag, record = UsersChatRoom::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:users_chat_room).slice(:name)
  #   flag, _ = UsersChatRoom::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:users_chat_room)
  #   attrs = attributes_for(:users_chat_room)
  #   flag, _ = UsersChatRoom::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
