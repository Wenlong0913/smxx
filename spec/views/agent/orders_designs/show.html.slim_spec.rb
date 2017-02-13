require 'rails_helper'

RSpec.describe "agent/orders_designs/show", type: :view do
  before(:each) do
    @agent_orders_design = assign(:agent_orders_design, Agent::OrdersDesign.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
