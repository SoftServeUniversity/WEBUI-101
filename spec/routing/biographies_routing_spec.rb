require "spec_helper"

describe BiographiesController do
  describe "routing" do

    it "routes to #index" do
      get("/biographies").should route_to("biographies#index")
    end

    it "routes to #new" do
      get("/biographies/new").should route_to("biographies#new")
    end

    it "routes to #show" do
      get("/biographies/1").should route_to("biographies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/biographies/1/edit").should route_to("biographies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/biographies").should route_to("biographies#create")
    end

    it "routes to #update" do
      put("/biographies/1").should route_to("biographies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/biographies/1").should route_to("biographies#destroy", :id => "1")
    end

  end
end
