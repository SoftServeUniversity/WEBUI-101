require "spec_helper"

describe Admin::BiographiesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/biographies").should route_to("admin/biographies#index")
    end

    it "routes to #new" do
      get("/admin/biographies/new").should route_to("admin/biographies#new")
    end

    it "routes to #show" do
      get("/admin/biographies/1").should route_to("admin/biographies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/biographies/1/edit").should route_to("admin/biographies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/biographies").should route_to("admin/biographies#create")
    end

    it "routes to #update" do
      put("/admin/biographies/1").should route_to("admin/biographies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/biographies/1").should route_to("admin/biographies#destroy", :id => "1")
    end

  end
end
