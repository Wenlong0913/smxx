require 'rails_helper'

RSpec.describe "admin/teachers/show", type: :view do
  before(:each) do
    @admin_teacher = assign(:admin_teacher, Admin::Teacher.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
