require 'rails_helper'

RSpec.describe "agent/teachers/new", type: :view do
  before(:each) do
    assign(:teacher, Teacher.new())
  end
  it "renders new agent_teacher form" do
    render
    assert_select "form[action=?][method=?]", agent_teachers_path, "post" do
    end
  end
end
