require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  describe 'attribtues' do
    subject { described_class.new.attributes }
    it { should include('name') }
    it { should include('chinese_name') }
    it { should include('created_at') }
    it { should include('updated_at') }
  end

  it 'is valid with valid attributes'
  it 'is not valid without name'
  it 'is not valid without display_name'
  it { should have_many :theme_configs }
  it { should have_many :sites }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
