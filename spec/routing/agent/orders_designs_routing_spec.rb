require "rails_helper"

RSpec.describe Agent::OrdersDesignsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/orders_designs").to route_to("agent/orders_designs#index")
    end

    it "routes to #new" do
      expect(:get => "/agent/orders_designs/new").to route_to("agent/orders_designs#new")
    end

    it "routes to #show" do
      expect(:get => "/agent/orders_designs/1").to route_to("agent/orders_designs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agent/orders_designs/1/edit").to route_to("agent/orders_designs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agent/orders_designs").to route_to("agent/orders_designs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agent/orders_designs/1").to route_to("agent/orders_designs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agent/orders_designs/1").to route_to("agent/orders_designs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agent/orders_designs/1").to route_to("agent/orders_designs#destroy", :id => "1")
    end

  end
end
