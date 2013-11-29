require "spec_helper"

describe Admin::ArticlesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/articles").should route_to("admin/articles#index")
    end

    it "routes to #new" do
      get("/admin/articles/new").should route_to("admin/articles#new")
    end

    it "routes to #show" do
      get("/admin/articles/1").should route_to("admin/articles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/articles/1/edit").should route_to("admin/articles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/articles").should route_to("admin/articles#create")
    end

    it "routes to #update" do
      put("/admin/articles/1").should route_to("admin/articles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/articles/1").should route_to("admin/articles#destroy", :id => "1")
    end

  end
end
