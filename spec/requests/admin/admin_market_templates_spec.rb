require 'rails_helper'

RSpec.describe "Admin::MarketTemplates", type: :request do
  describe "GET /admin_market_templates" do
    it "works! (now write some real specs)" do
      get admin_market_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
