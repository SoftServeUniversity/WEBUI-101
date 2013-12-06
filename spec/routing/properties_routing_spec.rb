require "spec_helper"

describe Admin::PropertiesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/properties").should route_to("admin/properties#index")
    end

    it "routes to #new" do
      get("/admin/properties/new").should route_to("admin/properties#new")
    end

    it "routes to #show" do
      get("/admin/properties/1").should route_to("admin/properties#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/properties/1/edit").should route_to("admin/properties#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/properties").should route_to("admin/properties#create")
    end

    it "routes to #update" do
      put("/admin/properties/1").should route_to("admin/properties#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/properties/1").should route_to("admin/properties#destroy", :id => "1")
    end

  end
end
