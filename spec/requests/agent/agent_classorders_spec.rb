require 'rails_helper'

RSpec.describe "Agent::Classorders", type: :request do
  describe "GET /agent_classorders" do
    it "works! (now write some real specs)" do
      get agent_classorders_path
      expect(response).to have_http_status(200)
    end
  end
end
