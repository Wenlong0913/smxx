require "rails_helper"

RSpec.describe Admin::MaterialOutputsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/material_outputs").to route_to("admin/material_outputs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/material_outputs/new").to route_to("admin/material_outputs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/material_outputs/1").to route_to("admin/material_outputs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/material_outputs/1/edit").to route_to("admin/material_outputs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/material_outputs").to route_to("admin/material_outputs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/material_outputs/1").to route_to("admin/material_outputs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/material_outputs/1").to route_to("admin/material_outputs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/material_outputs/1").to route_to("admin/material_outputs#destroy", :id => "1")
    end

  end
end
