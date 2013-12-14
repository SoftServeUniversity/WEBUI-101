require 'spec_helper'
describe Admin::UsersController do
  let(:valid_session) { {} }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}, valid_session
      assigns(:users).should eq([user])
    end
  end


  describe "DELETE destroy" do


    it "deletes the user" do
      expect{
        delete :destroy, id: user
      }.to change(User,:count).by(-1)
    end

    it "redirects to the users list" do

      delete :destroy, id: user
      response.should redirect_to admin_users_path
    end
  end
end
