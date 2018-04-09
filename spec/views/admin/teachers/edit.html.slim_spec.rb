require 'rails_helper'

RSpec.describe "admin/teachers/edit", type: :view do
  before(:each) do
    @admin_teacher = assign(:admin_teacher, Admin::Teacher.create!(id: 1, ))
  end
  it "renders the edit admin_teacher form" do
    render
    assert_select "form[action=?][method=?]", admin_teacher_path(@admin_teacher), "post" do
    end
  end
end
