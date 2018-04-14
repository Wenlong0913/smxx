require 'rails_helper'

RSpec.describe "admin/teachers/index", type: :view do
  before(:each) do
    assign(:admin_teachers, [
      Admin::Teacher.new(id: 1,),
      Admin::Teacher.new(id: 2,)
    ])
  end
  it "renders a list of admin/teachers" do
    render
  end
end
