require 'rails_helper'

RSpec.describe MaterialOutputDetail::Create, type: :model do
  it do
    record = create(:material_output_detail)
    true_of_false = MaterialOutputDetail::Destroy.(record)
    expect(true_of_false).to be_a(MaterialOutputDetail)
    expect(MaterialOutputDetail.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
