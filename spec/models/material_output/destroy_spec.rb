require 'rails_helper'

RSpec.describe MaterialOutput::Create, type: :model do
  it do
    record = create(:material_output)
    true_of_false = MaterialOutput::Destroy.(record)
    expect(true_of_false).to be_a(MaterialOutput)
    expect(MaterialOutput.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
