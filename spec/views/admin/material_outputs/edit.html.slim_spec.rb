require 'rails_helper'

RSpec.describe "admin/material_outputs/edit", type: :view do
  before(:each) do
    @material_output = assign(:material_output, MaterialOutput.create!(id: 1, ))
  end
  it "renders the edit admin_material_output form" do
    render
    assert_select "form[action=?][method=?]", admin_material_output_path(@material_output), "post" do
    end
  end
end
