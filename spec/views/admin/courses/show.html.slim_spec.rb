require 'rails_helper'

RSpec.describe "admin/courses/show", type: :view do
  before(:each) do
    @admin_course = assign(:admin_course, Admin::Course.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
