require 'rails_helper'

RSpec.describe Site, type: :model do
  
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  subject { described_class.new(title: 'SXH') }

  it 'is valid with valid attribues' do
    expect(subject).to be_valid
  end

  it 'is not valid without title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it { should belong_to :theme_config }
  it { should belong_to :user }
  it { should have_many :pages }
  it { should validate_presence_of :theme_config }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user }
  it { should validate_uniqueness_of :user }

end
