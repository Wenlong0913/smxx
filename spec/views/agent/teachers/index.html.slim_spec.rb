require 'rails_helper'

RSpec.describe "agent/teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [
      Teacher.new(id: 1,),
      Teacher.new(id: 2,)
    ])
  end
  it "renders a list of agent/teachers" do
    render
  end
end
