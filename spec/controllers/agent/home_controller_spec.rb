require 'rails_helper'

RSpec.describe Agent::HomeController, type: :controller do

  describe "routing" do
    it "routes GET / to Agent::HomeController#index" do
      expect(get: agent_root_path).to route_to('agent/home#index')
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
