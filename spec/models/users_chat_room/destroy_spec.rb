require 'rails_helper'

RSpec.describe UsersChatRoom::Create, type: :model do
  it do
    record = create(:users_chat_room)
    true_of_false = UsersChatRoom::Destroy.(record)
    expect(true_of_false).to be_a(UsersChatRoom)
    expect(UsersChatRoom.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
