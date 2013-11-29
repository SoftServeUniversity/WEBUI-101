require "spec_helper"

describe Admin::MuseumsController do
  describe "routing" do

    it "routes to #index" do
      get("admin/museums").should route_to("admin/museums#index")
    end

    it "routes to #new" do
      get("admin/museums/new").should route_to("admin/museums#new")
    end

    it "routes to #show" do
      get("admin/museums/1").should route_to("admin/museums#show", :id => "1")
    end

    it "routes to #edit" do
      get("admin/museums/1/edit").should route_to("admin/museums#edit", :id => "1")
    end

    it "routes to #create" do
      post("admin/museums").should route_to("admin/museums#create")
    end

    it "routes to #update" do
      put("admin/museums/1").should route_to("admin/museums#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("admin/museums/1").should route_to("admin/museums#destroy", :id => "1")
    end

  end
end
