require 'rails_helper'

RSpec.describe "agent/courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new())
  end
  it "renders new agent_course form" do
    render
    assert_select "form[action=?][method=?]", agent_courses_path, "post" do
    end
  end
end
