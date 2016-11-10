require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it { should have_one :mobile }

  describe 'attribtues' do
    subject { described_class.new.attributes }
    it { should include('nickname') }
    it { should include('username') }
    it { should include('email') }
    it { should include('created_at') }
    it { should include('updated_at') }
  end

  describe 'instance' do
    subject { User.new }
    it { should have_attr_accessor :mobile_phone }
  end

  it 'is valid with valid attributes' do
    flag, user = User::Create.(password: 'abc', mobile_phone: '13912345678')
    expect(flag).to be(true)
  end

end
