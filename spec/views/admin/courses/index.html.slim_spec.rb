require 'rails_helper'

RSpec.describe "admin/courses/index", type: :view do
  before(:each) do
    assign(:admin_courses, [
      Admin::Course.new(id: 1,),
      Admin::Course.new(id: 2,)
    ])
  end
  it "renders a list of admin/courses" do
    render
  end
end
