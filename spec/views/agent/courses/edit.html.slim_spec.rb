require 'rails_helper'

RSpec.describe "agent/courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(id: 1, ))
  end
  it "renders the edit agent_course form" do
    render
    assert_select "form[action=?][method=?]", agent_course_path(@course), "post" do
    end
  end
end
