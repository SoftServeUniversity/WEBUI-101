require 'spec_helper'
describe ExhibitsController do
let(:exhibit) { FactoryGirl.create(:exhibit) }
  describe "GET index" do
    it "assigns all exhibits as @exhibits" do
      get :index, {}
      assigns(:exhibits).should eq([exhibit])
    end
  end

  describe "GET show" do
    it "assigns the requested exhibit as @exhibit" do
      exhibit =FactoryGirl.create(:exhibit)
      get :show, {:id => exhibit.to_param}
      assigns(:exhibit).should eq(exhibit)
    end
  end
end
