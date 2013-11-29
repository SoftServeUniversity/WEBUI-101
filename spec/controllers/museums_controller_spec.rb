require 'spec_helper'

describe MuseumsController do

  let(:valid_attributes) { { name: 'Prado', address: 'Madrid, Paseo del Prado'  } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all museums as @museums" do
      museum = Museum.create! valid_attributes
      get :index, {}, valid_session
      assigns(:museums).should eq([museum])
    end
  end

  describe "GET show" do
    it "assigns the requested museum as @museum" do
      museum = Museum.create! valid_attributes
      get :show, {:id => museum.to_param}, valid_session
      assigns(:museum).should eq(museum)
    end
  end

  describe "GET new" do
    it "assigns a new museum as @museum" do
      get :new, {}, valid_session
      assigns(:museum).should be_a_new(Museum)
    end
  end

  describe "GET edit" do
    it "assigns the requested museum as @museum" do
      museum = Museum.create! valid_attributes
      get :edit, {:id => museum.to_param}, valid_session
      assigns(:museum).should eq(museum)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Museum" do
        expect {
          post :create, {:museum => valid_attributes}, valid_session
        }.to change(Museum, :count).by(1)
      end

      it "assigns a newly created museum as @museum" do
        post :create, {:museum => valid_attributes}, valid_session
        assigns(:museum).should be_a(Museum)
        assigns(:museum).should be_persisted
      end

      it "redirects to the created museum" do
        post :create, {:museum => valid_attributes}, valid_session
        response.should redirect_to(Museum.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved museum as @museum" do
        # Trigger the behavior that occurs when invalid params are submitted
        Museum.any_instance.stub(:save).and_return(false)
        post :create, {:museum => { "name" => "invalid value" }}, valid_session
        assigns(:museum).should be_a_new(Museum)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Museum.any_instance.stub(:save).and_return(false)
        post :create, {:museum => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested museum" do
        museum = Museum.create! valid_attributes
        # Assuming there are no other museums in the database, this
        # specifies that the Museum created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Museum.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => museum.to_param, :museum => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested museum as @museum" do
        museum = Museum.create! valid_attributes
        put :update, {:id => museum.to_param, :museum => valid_attributes}, valid_session
        assigns(:museum).should eq(museum)
      end

      it "redirects to the museum" do
        museum = Museum.create! valid_attributes
        put :update, {:id => museum.to_param, :museum => valid_attributes}, valid_session
        response.should redirect_to(museum)
      end
    end

    describe "with invalid params" do
      it "assigns the museum as @museum" do
        museum = Museum.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Museum.any_instance.stub(:save).and_return(false)
        put :update, {:id => museum.to_param, :museum => { "name" => "invalid value" }}, valid_session
        assigns(:museum).should eq(museum)
      end

      it "re-renders the 'edit' template" do
        museum = Museum.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Museum.any_instance.stub(:save).and_return(false)
        put :update, {:id => museum.to_param, :museum => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested museum" do
      museum = Museum.create! valid_attributes
      expect {
        delete :destroy, {:id => museum.to_param}, valid_session
      }.to change(Museum, :count).by(-1)
    end

    it "redirects to the museums list" do
      museum = Museum.create! valid_attributes
      delete :destroy, {:id => museum.to_param}, valid_session
      response.should redirect_to(museums_url)
    end
  end

end
