require 'rails_helper'

RSpec.describe "admin/material_management_details/edit", type: :view do
  before(:each) do
    @material_management_detail = assign(:material_management_detail, MaterialManagementDetail.create!(id: 1, ))
  end
  it "renders the edit admin_material_management_detail form" do
    render
    assert_select "form[action=?][method=?]", admin_material_management_detail_path(@material_management_detail), "post" do
    end
  end
end
