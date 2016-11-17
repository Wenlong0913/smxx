require 'rails_helper'

RSpec.describe User::Weixin, type: :model do
  it 'attributes' do
    expected_attributes = %w(
      id user_id uid name headshot city province country gender
      created_at updated_at
    )
    diff = User::Weixin.attributes.keys + expected_attributes - (User::Weixin.attributes.keys & expected_attributes)
    expect(diff).to be_empty
  end
  it { should belong_to :user }
  it { should validate_presence_of :uid }
  it { should validate_uniqueness_of :uid }
end
