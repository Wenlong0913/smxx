require 'rails_helper'

RSpec.describe "admin/material_outputs/index", type: :view do
  before(:each) do
    assign(:material_outputs, [
      MaterialOutput.new(id: 1,),
      MaterialOutput.new(id: 2,)
    ])
  end
  it "renders a list of admin/material_outputs" do
    render
  end
end
