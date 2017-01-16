require 'rails_helper'

RSpec.describe "admin/material_management_details/new", type: :view do
  before(:each) do
    assign(:material_management_detail, MaterialManagementDetail.new())
  end
  it "renders new admin_material_management_detail form" do
    render
    assert_select "form[action=?][method=?]", admin_material_management_details_path, "post" do
    end
  end
end
