require 'rails_helper'

RSpec.describe "admin/teachers/new", type: :view do
  before(:each) do
    assign(:admin_teacher, Admin::Teacher.new())
  end
  it "renders new admin_teacher form" do
    render
    assert_select "form[action=?][method=?]", admin_teachers_path, "post" do
    end
  end
end
