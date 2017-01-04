require 'rails_helper'

RSpec.describe "admin/material_outputs/show", type: :view do
  before(:each) do
    @material_output = assign(:material_output, MaterialOutput.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
