require 'rails_helper'

RSpec.describe "agent/classorders/index", type: :view do
  before(:each) do
    assign(:classorders, [
      Classorder.new(id: 1,),
      Classorder.new(id: 2,)
    ])
  end
  it "renders a list of agent/classorders" do
    render
  end
end
