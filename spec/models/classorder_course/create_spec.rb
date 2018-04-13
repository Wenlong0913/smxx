require 'rails_helper'

RSpec.describe ClassorderCourse::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:classorder_course)
    flag, record = ClassorderCourse::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:classorder_course).slice(:name)
  #   flag, _ = ClassorderCourse::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:classorder_course)
  #   attrs = attributes_for(:classorder_course)
  #   flag, _ = ClassorderCourse::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
