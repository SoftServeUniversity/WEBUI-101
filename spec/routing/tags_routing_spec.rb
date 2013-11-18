require "spec_helper"

describe TagsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/tags").should route_to("tags#index")
    end

    it "routes to #new" do
      get("/admin/tags/new").should route_to("tags#new")
    end

    it "routes to #show" do
      get("/admin/tags/1").should route_to("tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/tags/1/edit").should route_to("tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/tags").should route_to("tags#create")
    end

    it "routes to #update" do
      put("/admin/tags/1").should route_to("tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/tags/1").should route_to("tags#destroy", :id => "1")
    end

  end
end
