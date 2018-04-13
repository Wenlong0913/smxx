require 'rails_helper'

RSpec.describe "agent/classorders/edit", type: :view do
  before(:each) do
    @classorder = assign(:classorder, Classorder.create!(id: 1, ))
  end
  it "renders the edit agent_classorder form" do
    render
    assert_select "form[action=?][method=?]", agent_classorder_path(@classorder), "post" do
    end
  end
end
