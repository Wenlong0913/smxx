require 'rails_helper'

RSpec.describe ClassorderCourse::Create, type: :model do
  it do
    record = create(:classorder_course)
    true_of_false = ClassorderCourse::Destroy.(record)
    expect(true_of_false).to be_a(ClassorderCourse)
    expect(ClassorderCourse.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
