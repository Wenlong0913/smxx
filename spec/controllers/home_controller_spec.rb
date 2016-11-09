require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "routing" do
    it "routes GET / to HomeController#index" do
      expect(get: root_path).to route_to('home#index')
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
