require 'rails_helper'

RSpec.describe "agent/orders_designs/new", type: :view do
  before(:each) do
    assign(:agent_orders_design, Agent::OrdersDesign.new())
  end
  it "renders new agent_orders_design form" do
    render
    assert_select "form[action=?][method=?]", agent_orders_designs_path, "post" do
    end
  end
end
