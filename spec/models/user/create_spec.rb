require 'rails_helper'
RSpec.describe 'User::Create.()', type: :model do
  it 'with mobile_number' do
    flag, user = User::Create.(password: 'abc', mobile_number: '13912345678')
    expect(flag).to be(true)
  end

  it 'without mobile_number' do
    flag, user = User::Create.(password: 'abc')
    expect(flag).to be(false)
  end
end