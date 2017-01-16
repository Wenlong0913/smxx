require 'rails_helper'

RSpec.describe "admin/material_management_details/show", type: :view do
  before(:each) do
    @material_management_detail = assign(:material_management_detail, MaterialManagementDetail.new(id: 1))
  end
  it "renders attributes in <p>" do
    render
  end
end
