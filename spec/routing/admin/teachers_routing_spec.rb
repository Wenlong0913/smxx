require "rails_helper"

RSpec.describe Admin::TeachersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/teachers").to route_to("admin/teachers#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/teachers/new").to route_to("admin/teachers#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/teachers/1").to route_to("admin/teachers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/teachers/1/edit").to route_to("admin/teachers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/teachers").to route_to("admin/teachers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/teachers/1").to route_to("admin/teachers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/teachers/1").to route_to("admin/teachers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/teachers/1").to route_to("admin/teachers#destroy", :id => "1")
    end

  end
end
