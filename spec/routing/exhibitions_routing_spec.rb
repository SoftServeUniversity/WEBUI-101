require "spec_helper"

describe Admin::ExhibitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/exhibitions").should route_to("admin/exhibitions#index")
    end

    it "routes to #new" do
      get("/admin/exhibitions/new").should route_to("admin/exhibitions#new")
    end

    it "routes to #show" do
      get("/admin/exhibitions/1").should route_to("admin/exhibitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/exhibitions/1/edit").should route_to("admin/exhibitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/exhibitions").should route_to("admin/exhibitions#create")
    end

    it "routes to #update" do
      put("/admin/exhibitions/1").should route_to("admin/exhibitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/exhibitions/1").should route_to("admin/exhibitions#destroy", :id => "1")
    end

  end
end
