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

  describe 'attribtues' do
    subject { described_class.new.attributes }
    it { should include('title') }
    it { should include('short_title') }
    it { should include('description') }
    it { should include('created_at') }
    it { should include('updated_at') }
  end

  it { should belong_to :site }
  it { should validate_presence_of :title }

  let(:user) { create(:user) }
  let(:site) { create(:site, user: user) }
  
  subject { build(:page, site: site) }

  it 'is valid with valid attribues' do
    expect(subject).to be_valid
  end
end
