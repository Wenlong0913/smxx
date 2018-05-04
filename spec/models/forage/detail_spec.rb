<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: forage_details
#
#  id            :integer          not null, primary key
#  url           :string           not null
#  migrate_to    :string
#  can_purchase  :boolean          default(FALSE)
#  purchase_url  :string
#  title         :string
#  keywords      :string
#  image         :string
#  description   :string
#  content       :text
#  date          :string
#  time          :string
#  address_line1 :string
#  address_line2 :string
#  phone         :string
#  price         :string
#  from          :string
#  has_site      :boolean          default(FALSE)
#  site_name     :string
#  note          :string
#  features      :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  simple_id     :integer          not null
#  is_merged     :string           default("n")
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
require 'rails_helper'

RSpec.describe Forage::Detail, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id simple url migrate_to can_purchase purchase_url title keywords image description content date time address_line1 address_line2 phone price from has_site site_name note features updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:detail) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:detail)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
