require 'rails_helper'

RSpec.describe "agent/teachers/show", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
