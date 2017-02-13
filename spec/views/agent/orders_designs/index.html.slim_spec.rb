require 'rails_helper'

RSpec.describe "agent/orders_designs/index", type: :view do
  before(:each) do
    assign(:agent_orders_designs, [
      Agent::OrdersDesign.new(id: 1,),
      Agent::OrdersDesign.new(id: 2,)
    ])
  end
  it "renders a list of agent/orders_designs" do
    render
  end
end
