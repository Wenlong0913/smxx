require 'rails_helper'

RSpec.describe "Admin::Teachers", type: :request do
  describe "GET /admin_teachers" do
    it "works! (now write some real specs)" do
      get admin_teachers_path
      expect(response).to have_http_status(200)
    end
  end
end
