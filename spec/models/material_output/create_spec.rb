require 'rails_helper'

RSpec.describe MaterialOutput::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:material_output)
    flag, record = MaterialOutput::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:material_output).slice(:name)
  #   flag, _ = MaterialOutput::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:material_output)
  #   attrs = attributes_for(:material_output)
  #   flag, _ = MaterialOutput::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
