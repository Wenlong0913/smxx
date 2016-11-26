# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  title       :string
#  short_title :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Page, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it do
    expect(Page.attribute_names).to match_array(%w(id site_id type title features updated_at created_at))
  end

  it { should belong_to :site }
  it { should have_and_belong_to_many :items }

  it { should validate_presence_of :title }
  it { should validate_presence_of :site }

  it { should have_attr_accessor :short_title }
  it { should have_attr_accessor :description }

  let(:user) { create(:user) }
  let(:site) { create(:site, user: user) }

  subject { build(:page, site: site) }

  it 'is valid with valid attribues' do
    expect(subject).to be_valid
  end

  it 'is invalid with invalid attribues' do
    expect(build(:page, site: nil)).not_to be_valid
  end
end
