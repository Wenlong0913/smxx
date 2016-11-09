require 'rails_helper'

RSpec.describe Page, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  subject { described_class.new(title: 'SXH') }

  it 'is valid with valid attribtues'
  it 'is not valid without site'
  it 'is not valid without title'

  it { should belong_to :site }
  it { should validate_presence_of :site }
  it { should validate_presence_of :title }
end
