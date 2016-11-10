require 'rails_helper'

RSpec.describe ThemeConfig, type: :model do
  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it { should belong_to :site }
  it { should belong_to :theme }
  it { should validate_uniqueness_of :site }
end
