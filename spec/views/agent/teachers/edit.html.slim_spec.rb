require 'rails_helper'

RSpec.describe "agent/teachers/edit", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(id: 1, ))
  end
  it "renders the edit agent_teacher form" do
    render
    assert_select "form[action=?][method=?]", agent_teacher_path(@teacher), "post" do
    end
  end
end
