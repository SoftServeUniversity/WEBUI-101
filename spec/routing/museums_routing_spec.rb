require "spec_helper"

describe MuseumsController do
  describe "routing" do

    it "routes to #index" do
      get("/museums").should route_to("museums#index")
    end

    it "routes to #new" do
      get("/museums/new").should route_to("museums#new")
    end

    it "routes to #show" do
      get("/museums/1").should route_to("museums#show", :id => "1")
    end

    it "routes to #edit" do
      get("/museums/1/edit").should route_to("museums#edit", :id => "1")
    end

    it "routes to #create" do
      post("/museums").should route_to("museums#create")
    end

    it "routes to #update" do
      put("/museums/1").should route_to("museums#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/museums/1").should route_to("museums#destroy", :id => "1")
    end

  end
end
