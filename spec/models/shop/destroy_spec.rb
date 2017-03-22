require 'rails_helper'

RSpec.describe Shop::Create, type: :model do
  it do
    record = create(:shop)
    true_of_false = Shop::Destroy.(record)
    expect(true_of_false).to be_a(Shop)
    expect(Shop.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
