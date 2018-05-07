require "rails_helper"

RSpec.describe Agent::TeachersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/teachers").to route_to("agent/teachers#index")
    end

    it "routes to #new" do
      expect(:get => "/agent/teachers/new").to route_to("agent/teachers#new")
    end

    it "routes to #show" do
      expect(:get => "/agent/teachers/1").to route_to("agent/teachers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agent/teachers/1/edit").to route_to("agent/teachers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agent/teachers").to route_to("agent/teachers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agent/teachers/1").to route_to("agent/teachers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agent/teachers/1").to route_to("agent/teachers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agent/teachers/1").to route_to("agent/teachers#destroy", :id => "1")
    end

  end
end
