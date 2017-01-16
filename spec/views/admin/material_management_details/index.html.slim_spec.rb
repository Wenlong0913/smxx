require 'rails_helper'

RSpec.describe "admin/material_management_details/index", type: :view do
  before(:each) do
    assign(:material_management_details, [
      MaterialManagementDetail.new(id: 1,),
      MaterialManagementDetail.new(id: 2,)
    ])
  end
  it "renders a list of admin/material_management_details" do
    render
  end
end
