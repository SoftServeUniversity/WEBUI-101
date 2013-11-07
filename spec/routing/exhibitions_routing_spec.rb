require "spec_helper"

describe ExhibitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/exhibitions").should route_to("exhibitions#index")
    end

    it "routes to #new" do
      get("/exhibitions/new").should route_to("exhibitions#new")
    end

    it "routes to #show" do
      get("/exhibitions/1").should route_to("exhibitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/exhibitions/1/edit").should route_to("exhibitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/exhibitions").should route_to("exhibitions#create")
    end

    it "routes to #update" do
      put("/exhibitions/1").should route_to("exhibitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/exhibitions/1").should route_to("exhibitions#destroy", :id => "1")
    end

  end
end
