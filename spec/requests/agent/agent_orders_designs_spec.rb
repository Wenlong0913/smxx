require 'rails_helper'

RSpec.describe "Agent::OrdersDesigns", type: :request do
  describe "GET /agent_orders_designs" do
    it "works! (now write some real specs)" do
      get agent_orders_designs_path
      expect(response).to have_http_status(200)
    end
  end
end
