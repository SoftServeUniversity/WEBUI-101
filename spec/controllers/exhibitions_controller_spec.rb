require 'spec_helper'

describe ExhibitionsController do
  let(:exhibition) { FactoryGirl.create(:exhibition) }
  describe "GET index" do
    it "assigns all exhibitions as @exhibitions" do
      get :index, {}
      assigns(:exhibitions).should eq([exhibition])
    end
  end
  describe "GET show" do
    it "assigns the requested exhibition as @exhibition" do
      exhibition = FactoryGirl.create(:exhibition)
      get :show, {:id => exhibition.to_param}
      assigns(:exhibition).should eq(exhibition)
    end
  end
end
