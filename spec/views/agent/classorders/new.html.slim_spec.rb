require 'rails_helper'

RSpec.describe "agent/classorders/new", type: :view do
  before(:each) do
    assign(:classorder, Classorder.new())
  end
  it "renders new agent_classorder form" do
    render
    assert_select "form[action=?][method=?]", agent_classorders_path, "post" do
    end
  end
end
