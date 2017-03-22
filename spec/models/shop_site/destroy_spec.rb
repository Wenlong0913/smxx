require 'rails_helper'

RSpec.describe ShopSite::Create, type: :model do
  it do
    record = create(:shop_site)
    true_of_false = ShopSite::Destroy.(record)
    expect(true_of_false).to be_a(ShopSite)
    expect(ShopSite.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
