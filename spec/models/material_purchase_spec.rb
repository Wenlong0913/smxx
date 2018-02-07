# == Schema Information
#
# Table name: material_purchases
#
#  id         :integer          not null, primary key
#  vendor_id  :integer
#  features   :jsonb
#  created_by :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#

require 'rails_helper'

RSpec.describe MaterialPurchase, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id  updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:material_purchase) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:material_purchase)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
