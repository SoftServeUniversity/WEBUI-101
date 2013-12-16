require "spec_helper"

describe Admin::MarkdownImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/markdown_images").should route_to("admin/markdown_images#index")
    end

    it "routes to #new" do
      get("/admin/markdown_images/new").should route_to("admin/markdown_images#new")
    end

    it "routes to #show" do
      get("/admin/markdown_images/1").should route_to("admin/markdown_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/markdown_images/1/edit").should route_to("admin/markdown_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/markdown_images").should route_to("admin/markdown_images#create")
    end

    it "routes to #update" do
      put("/admin/markdown_images/1").should route_to("admin/markdown_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/markdown_images/1").should route_to("admin/markdown_images#destroy", :id => "1")
    end

  end
end
