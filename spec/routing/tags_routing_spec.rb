require "spec_helper"

describe Admin::TagsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/tags").should route_to("admin/tags#index")
    end

    it "routes to #new" do
      get("/admin/tags/new").should route_to("admin/tags#new")
    end

    it "routes to #show" do
      get("/admin/tags/1").should route_to("admin/tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/tags/1/edit").should route_to("admin/tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/tags").should route_to("admin/tags#create")
    end

    it "routes to #update" do
      put("/admin/tags/1").should route_to("admin/tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/tags/1").should route_to("admin/tags#destroy", :id => "1")
    end

  end
end
