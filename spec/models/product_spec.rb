# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  site_id         :integer
#  name            :string
#  features        :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type            :string
#  name_py         :string
#  catalog_id      :integer
#  comments_count  :integer          default(0)
#  favorites_count :integer          default(0)
#  visits_count    :integer          default(0)
#  likes_count     :integer          default(0)
#  sales_count     :integer          default(0)
#  forage          :jsonb
#

require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Create/Update/Destroy" do
    it { expect(described_class::Create).to be_a(Proc) }
    it { expect(described_class::Update).to be_a(Proc) }
    it { expect(described_class::Destroy).to be_a(Proc) }
  end

  it { expect(described_class).to be < Item }
  it { should have_attr_accessor :description }
  it { should have_attr_accessor :price }
  it { should have_attr_accessor :unit }
  it { should validate_numericality_of :price }
end
