require 'rails_helper'

RSpec.describe "agent/orders_designs/edit", type: :view do
  before(:each) do
    @agent_orders_design = assign(:agent_orders_design, Agent::OrdersDesign.create!(id: 1, ))
  end
  it "renders the edit agent_orders_design form" do
    render
    assert_select "form[action=?][method=?]", agent_orders_design_path(@agent_orders_design), "post" do
    end
  end
end
