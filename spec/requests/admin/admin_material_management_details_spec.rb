require 'rails_helper'

RSpec.describe "Admin::MaterialManagementDetails", type: :request do
  describe "GET /admin_material_management_details" do
    it "works! (now write some real specs)" do
      get admin_material_management_details_path
      expect(response).to have_http_status(200)
    end
  end
end
