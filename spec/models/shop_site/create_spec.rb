require 'rails_helper'

RSpec.describe ShopSite::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:shop_site)
    flag, record = ShopSite::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:shop_site).slice(:name)
  #   flag, _ = ShopSite::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:shop_site)
  #   attrs = attributes_for(:shop_site)
  #   flag, _ = ShopSite::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
