require 'rails_helper'

RSpec.describe AgentPlan::Create, type: :model do
  it 'with valid attributes' do
    attrs = attributes_for(:agent_plan)
    flag, record = AgentPlan::Create.(attrs)
    expect(flag).to eq(true)
    attrs.each_pair do |k, v|
      expect(record.send(k)).to eq(v)
    end
  end

  # it 'without title' do
  #   attrs = attributes_for(:agent_plan).slice(:name)
  #   flag, _ = AgentPlan::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  # it 'with existing record' do
  #   create(:agent_plan)
  #   attrs = attributes_for(:agent_plan)
  #   flag, _ = AgentPlan::Create.(attrs)
  #   expect(flag).to eq(false)
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
