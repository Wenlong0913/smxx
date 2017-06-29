require 'rails_helper'

RSpec.describe AgentPlan::Create, type: :model do
  it do
    record = create(:agent_plan)
    true_of_false = AgentPlan::Destroy.(record)
    expect(true_of_false).to be_a(AgentPlan)
    expect(AgentPlan.exists?(record.id)).to eq(false)
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
