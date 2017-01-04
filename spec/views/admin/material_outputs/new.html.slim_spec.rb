require 'rails_helper'

RSpec.describe "admin/material_outputs/new", type: :view do
  before(:each) do
    assign(:material_output, MaterialOutput.new())
  end
  it "renders new admin_material_output form" do
    render
    assert_select "form[action=?][method=?]", admin_material_outputs_path, "post" do
    end
  end
end
