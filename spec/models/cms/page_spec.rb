<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: cms_pages
#
#  id                :integer          not null, primary key
#  channel_id        :integer          not null
#  title             :string           not null
#  short_title       :string           not null
#  keywords          :string
#  description       :string
#  image_path        :string
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  properties        :string           default([]), is an Array
#  impressions_count :integer          default(0)
#  comments_count    :integer          default(0)
#  forage            :jsonb
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
require 'rails_helper'

RSpec.describe Cms::Page, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(described_class.attribute_names).to match_array(%w(id channel title short_title properties keywords description image_path content updated_at created_at))
  end

  # it { should have_many(:xxx) }
  # it { should belong_to :xxx }
  # it { should validate_presence_of :xxx }
  # it { should validate_uniqueness_of(:a).scoped_to(:b) }
  # it { should have_attr_accessor :xxx }

  describe "Instance" do
    subject { build(:page) }

    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    # it 'is invalid with invalid attribues' do
    #   expect(described_class.new).not_to be_valid
    # end

  end

  it 'is versioned' do
    record = create(:page)
    expect(record.audits.size).to eq(1)
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
