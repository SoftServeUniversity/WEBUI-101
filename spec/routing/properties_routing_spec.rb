require "spec_helper"

describe PropertiesController do
  describe "routing" do

    it "routes to #index" do
      get("/properties").should route_to("properties#index")
    end

    it "routes to #new" do
      get("/properties/new").should route_to("properties#new")
    end

    it "routes to #show" do
      get("/properties/1").should route_to("properties#show", :id => "1")
    end

    it "routes to #edit" do
      get("/properties/1/edit").should route_to("properties#edit", :id => "1")
    end

    it "routes to #create" do
      post("/properties").should route_to("properties#create")
    end

    it "routes to #update" do
      put("/properties/1").should route_to("properties#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/properties/1").should route_to("properties#destroy", :id => "1")
    end

  end
end
