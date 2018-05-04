# == Schema Information
#
# Table name: market_templates
#
#  id           :integer          not null, primary key
#  catalog_id   :integer          not null
#  base_path    :string           not null
#  name         :string           not null
#  keywords     :string
#  description  :string
#  image_path   :string
#  html_source  :text
#  form_source  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_published :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe MarketTemplate, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id market_catalog base_path name keywords description image_path html_source form_source updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:market_template) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:market_template)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
