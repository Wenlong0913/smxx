require "rails_helper"

RSpec.describe Agent::ClassordersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/classorders").to route_to("agent/classorders#index")
    end

    it "routes to #new" do
      expect(:get => "/agent/classorders/new").to route_to("agent/classorders#new")
    end

    it "routes to #show" do
      expect(:get => "/agent/classorders/1").to route_to("agent/classorders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agent/classorders/1/edit").to route_to("agent/classorders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agent/classorders").to route_to("agent/classorders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agent/classorders/1").to route_to("agent/classorders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agent/classorders/1").to route_to("agent/classorders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agent/classorders/1").to route_to("agent/classorders#destroy", :id => "1")
    end

  end
end
