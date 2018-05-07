require 'rails_helper'

RSpec.describe "Agent::Teachers", type: :request do
  describe "GET /agent_teachers" do
    it "works! (now write some real specs)" do
      get agent_teachers_path
      expect(response).to have_http_status(200)
    end
  end
end
