require 'rails_helper'

RSpec.describe Teacher::Create, type: :model do
  it do
    record = create(:teacher)
    true_of_false = Teacher::Destroy.(record)
    expect(true_of_false).to be_a(Teacher)
    expect(Teacher.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
