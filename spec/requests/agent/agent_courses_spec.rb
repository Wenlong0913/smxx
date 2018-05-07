require 'rails_helper'

RSpec.describe "Agent::Courses", type: :request do
  describe "GET /agent_courses" do
    it "works! (now write some real specs)" do
      get agent_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
