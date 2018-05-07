require "rails_helper"

RSpec.describe Agent::CoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agent/courses").to route_to("agent/courses#index")
    end

    it "routes to #new" do
      expect(:get => "/agent/courses/new").to route_to("agent/courses#new")
    end

    it "routes to #show" do
      expect(:get => "/agent/courses/1").to route_to("agent/courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agent/courses/1/edit").to route_to("agent/courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agent/courses").to route_to("agent/courses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agent/courses/1").to route_to("agent/courses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agent/courses/1").to route_to("agent/courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agent/courses/1").to route_to("agent/courses#destroy", :id => "1")
    end

  end
end
