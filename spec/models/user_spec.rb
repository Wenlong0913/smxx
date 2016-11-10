require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  describe 'attribtues' do
    subject { described_class.new.attributes }
    it { should include('nickname') }
    it { should include('created_at') }
    it { should include('updated_at') }
  end

  it 'is valid with valid attributes'
end
