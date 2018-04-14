require 'rails_helper'

RSpec.describe "agent/courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
