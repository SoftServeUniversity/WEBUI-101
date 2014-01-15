require 'spec_helper'

describe Admin::BiographiesController do
 let!(:user) { FactoryGirl.create(:user) }
 let(:biography) { FactoryGirl.create(:biography) }

  before(:each) do
    sign_in(user)
  end

  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all biographies as @biographies" do
      user.biographies << biography
      get :index, {}, valid_session
      expect(assigns(:biographies)).to eq(Kaminari.paginate_array(Biography.added_by(user)).page(1))
    end
  end

  describe "GET show" do
    it "assigns the requested biography as @biography" do
      get :show, {:id => biography.to_param}, valid_session
      assigns(:biography).should eq(biography)
    end
  end

  describe "GET new" do
    it "assigns a new biography as @biography" do
      get :new, {}, valid_session
      assigns(:biography).should be_a_new(Biography)
    end
  end

  describe "GET edit" do
    it "assigns the requested biography as @biography" do
      get :edit, {:id => biography.to_param}, valid_session
      assigns(:biography).should eq(biography)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Biography" do
        expect {
          post :create, {:biography => FactoryGirl.attributes_for(:biography)}, valid_session
        }.to change(Biography, :count).by(1)
      end

      it "assigns a newly created biography as @biography" do
        post :create, {:biography => FactoryGirl.attributes_for(:biography)}, valid_session
        assigns(:biography).should be_a(Biography)
        assigns(:biography).should be_persisted
      end

      it "redirects to the created biography" do
        post :create, {:biography => FactoryGirl.attributes_for(:biography)}, valid_session
        response.should redirect_to([:admin, Biography.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved biography as @biography" do
        Biography.any_instance.stub(:save).and_return(false)
        post :create, {:biography => { "name" => "invalid value" }}, valid_session
        assigns(:biography).should be_a_new(Biography)
      end

      it "re-renders the 'new' template" do
        Biography.any_instance.stub(:save).and_return(false)
        post :create, {:biography => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested biography" do
        Biography.any_instance.should_receive(:update).with({ "name" => "MyString",
                                                              "description" => 'description' })
        put :update, {:id => biography.to_param, :biography => { "name" => "MyString", "description" => 'description' }}, valid_session
      end

      it "assigns the requested biography as @biography" do
        put :update, {:id => biography.to_param, :biography => valid_attributes}, valid_session
        assigns(:biography).should eq(biography)
      end

      it "redirects to the biography" do
        put :update, {:id => biography.to_param, :biography => valid_attributes}, valid_session
        response.should redirect_to([:admin, biography])
      end
    end

    describe "with invalid params" do
      it "assigns the biography as @biography" do
        Biography.any_instance.stub(:save).and_return(false)
        put :update, {:id => biography.to_param, :biography => { "name" => "invalid value" }}, valid_session
        assigns(:biography).should eq(biography)
      end

      it "re-renders the 'edit' template" do
        Biography.any_instance.stub(:save).and_return(false)
        put :update, {:id => biography.to_param, :biography => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested biography" do
      biography
      expect {
        delete :destroy, {:id => biography.to_param}, valid_session
      }.to change(Biography, :count).by(-1)
    end

    it "redirects to the biographies list" do
      delete :destroy, {:id => biography.to_param}, valid_session
      response.should redirect_to(admin_biographies_url)
    end
  end

end
