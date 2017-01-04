require 'rails_helper'

RSpec.describe "Admin::MaterialOutputs", type: :request do
  describe "GET /admin_material_outputs" do
    it "works! (now write some real specs)" do
      get admin_material_outputs_path
      expect(response).to have_http_status(200)
    end
  end
end
