require 'rails_helper'

RSpec.describe Site, type: :model do
  
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  describe 'attribtues' do
    subject { described_class.new.attributes }
    it { should include('title') }
    it { should include('description') }
    it { should include('created_at') }
    it { should include('updated_at') }
  end

  it { should have_many(:theme_configs) }
  it { should have_one(:active_theme_config) }
  it { should belong_to :user }
  it { should have_many :pages }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of(:title).scoped_to(:user_id) }

  let(:user) { create(:user) }
  subject { build(:site, user: user) }

  it 'is valid with valid attribues' do
    expect(subject).to be_valid
  end
end
