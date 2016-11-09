require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do

  describe "routing" do
    it "routes GET / to Admin::HomeController#index" do
      expect(get: admin_root_path).to route_to('admin/home#index')
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
