require 'rails_helper'

RSpec.describe "agent/courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.new(id: 1,),
      Course.new(id: 2,)
    ])
  end
  it "renders a list of agent/courses" do
    render
  end
end
