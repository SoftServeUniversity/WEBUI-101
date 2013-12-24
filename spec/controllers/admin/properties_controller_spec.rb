require 'spec_helper'

describe Admin::PropertiesController do

  let(:valid_attributes) { { title: 'Prado', value: 'Madrid, Paseo del Prado'  } }

  let(:valid_session) { {} }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end


  describe "GET index" do
    it "assigns all properties as @properties" do
      property = Property.create! valid_attributes
      get :index, {}, valid_session
      assigns(:properties).should eq([property])
    end
  end

  describe "GET show" do
    it "assigns the requested property as @property" do
      property = Property.create! valid_attributes
      get :show, {:id => property.to_param}, valid_session
      assigns(:property).should eq(property)
    end
  end

  describe "GET new" do
    it "assigns a new property as @property" do
      get :new, {}, valid_session
      assigns(:property).should be_a_new(Property)
    end
  end

  describe "GET edit" do
    it "assigns the requested property as @property" do
      property = Property.create! valid_attributes
      get :edit, {:id => property.to_param}, valid_session
      assigns(:property).should eq(property)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Property" do
        expect {
          post :create, {:property => valid_attributes}, valid_session
        }.to change(Property, :count).by(1)
      end

      it "assigns a newly created property as @property" do
        post :create, {:property => valid_attributes}, valid_session
        assigns(:property).should be_a(Property)
        assigns(:property).should be_persisted
      end

      it "redirects to the created property" do
        post :create, {:property => valid_attributes}, valid_session
        response.should redirect_to([:admin, Property.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved property as @property" do
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        post :create, {:property => { "title" => "invalid value" }}, valid_session
        assigns(:property).should be_a_new(Property)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        post :create, {:property => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested property" do
        property = Property.create! valid_attributes
        # Assuming there are no other properties in the database, this
        # specifies that the Property created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Property.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => property.to_param, :property => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested property as @property" do
        property = Property.create! valid_attributes
        put :update, {:id => property.to_param, :property => valid_attributes}, valid_session
        assigns(:property).should eq(property)
      end

      it "redirects to the property" do
        property = Property.create! valid_attributes
        put :update, {:id => property.to_param, :property => valid_attributes}, valid_session
        response.should redirect_to([:admin, property])
      end
    end

    describe "with invalid params" do
      it "assigns the property as @property" do
        property = Property.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        put :update, {:id => property.to_param, :property => { "title" => "invalid value" }}, valid_session
        assigns(:property).should eq(property)
      end

      it "re-renders the 'edit' template" do
        property = Property.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        put :update, {:id => property.to_param, :property => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested property" do
      property = Property.create! valid_attributes
      expect {
        delete :destroy, {:id => property.to_param}, valid_session
      }.to change(Property, :count).by(-1)
    end

    it "redirects to the properties list" do
      property = Property.create! valid_attributes
      delete :destroy, {:id => property.to_param}, valid_session
      response.should redirect_to(admin_properties_url)
    end
  end

end
