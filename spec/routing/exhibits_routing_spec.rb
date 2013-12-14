require "spec_helper"

describe Admin::ExhibitsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/exhibits").should route_to("admin/exhibits#index")
    end

    it "routes to #new" do
      get("/admin/exhibits/new").should route_to("admin/exhibits#new")
    end

    it "routes to #show" do
      get("/admin/exhibits/1").should route_to("admin/exhibits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/exhibits/1/edit").should route_to("admin/exhibits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/exhibits").should route_to("admin/exhibits#create")
    end

    it "routes to #update" do
      put("/admin/exhibits/1").should route_to("admin/exhibits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/exhibits/1").should route_to("admin/exhibits#destroy", :id => "1")
    end

  end
end
describe ExhibitsController do
  describe "routing" do

    it "routes to #index" do
      get("/exhibits").should route_to("exhibits#index")
    end

    it "routes to #show" do
      get("/exhibits/1").should route_to("exhibits#show", :id => "1")
    end

  end
end
