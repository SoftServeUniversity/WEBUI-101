require 'spec_helper'

describe ExhibitionsController do

  # This should return the minimal set of attributes required to create a valid
  # Exhibition. As you add validations to Exhibition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:exhibition) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExhibitionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in :user, user # sign_in(scope, resource)
  end

  describe "GET index" do
    it "assigns all exhibitions as @exhibitions" do
      exhibition = Exhibition.create! valid_attributes
      get :index, {}, valid_session
      assigns(:exhibitions).should eq([exhibition])
    end
  end

  describe "GET show" do
    it "assigns the requested exhibition as @exhibition" do
      exhibition = Exhibition.create! valid_attributes
      get :show, {:id => exhibition.to_param}, valid_session
      assigns(:exhibition).should eq(exhibition)
    end
  end

  describe "GET new" do
    it "assigns a new exhibition as @exhibition" do
      get :new, {}, valid_session
      assigns(:exhibition).should be_a_new(Exhibition)
    end
  end

  describe "GET edit" do
    it "assigns the requested exhibition as @exhibition" do
      exhibition = Exhibition.create! valid_attributes
      get :edit, {:id => exhibition.to_param}, valid_session
      assigns(:exhibition).should eq(exhibition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Exhibition" do
        expect {
          post :create, {:exhibition => valid_attributes}, valid_session
        }.to change(Exhibition, :count).by(1)
      end

      it "assigns a newly created exhibition as @exhibition" do
        post :create, {:exhibition => valid_attributes}, valid_session
        assigns(:exhibition).should be_a(Exhibition)
        assigns(:exhibition).should be_persisted
      end

      it "redirects to the created exhibition" do
        post :create, exhibition: FactoryGirl.attributes_for(:exhibition)
        response.should redirect_to(Exhibition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved exhibition as @exhibition" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibition.any_instance.stub(:save).and_return(false)
        post :create, {:exhibition => { "name" => "invalid value" }}, valid_session
        assigns(:exhibition).should be_a_new(Exhibition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibition.any_instance.stub(:save).and_return(false)
        post :create, {:exhibition => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested exhibition" do
        exhibition = Exhibition.create! valid_attributes
        # Assuming there are no other exhibitions in the database, this
        # specifies that the Exhibition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Exhibition.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => exhibition.to_param, :exhibition => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested exhibition as @exhibition" do
        exhibition = Exhibition.create! valid_attributes
        put :update, {:id => exhibition.to_param, :exhibition => valid_attributes}, valid_session
        assigns(:exhibition).should eq(exhibition)
      end

      it "redirects to the exhibition" do
        exhibition = Exhibition.create! valid_attributes
        put :update, {:id => exhibition.to_param, :exhibition => valid_attributes}, valid_session
        response.should redirect_to(exhibition)
      end
    end

    describe "with invalid params" do
      it "assigns the exhibition as @exhibition" do
        exhibition = Exhibition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibition.any_instance.stub(:save).and_return(false)
        put :update, {:id => exhibition.to_param, :exhibition => { "name" => "invalid value" }}, valid_session
        assigns(:exhibition).should eq(exhibition)
      end

      it "re-renders the 'edit' template" do
        exhibition = Exhibition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibition.any_instance.stub(:save).and_return(false)
        put :update, {:id => exhibition.to_param, :exhibition => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested exhibition" do
      exhibition = Exhibition.create! valid_attributes
      expect {
        delete :destroy, {:id => exhibition.to_param}, valid_session
      }.to change(Exhibition, :count).by(-1)
    end

    it "redirects to the exhibitions list" do
      exhibition = Exhibition.create! valid_attributes
      delete :destroy, {:id => exhibition.to_param}, valid_session
      response.should redirect_to(exhibitions_url)
    end
  end

  describe 'POST add_exhibit' do
    let(:exhibit) { FactoryGirl.create(:exhibit) }
    let(:exhibition) { FactoryGirl.create(:exhibition) }

    before(:each) { post :add_exhibit, id: exhibition.id, exhibition: {exhibit_ids: exhibit.id} }

    it 'adds exhibit to exhibition' do
      expect(exhibition.exhibits).to include(exhibit)
    end
    it 'sets flash message' do
      expect(flash[:success]).not_to be_nil
    end
    it 'redirects to exhibition' do
      expect(response).to redirect_to(exhibition)
    end

    describe 'when cannot find exhibit' do
      it 'raises an error' do
        expect do
          post :add_exhibit, id: exhibition.id, exhibition: {exhibit_ids: nil}
        end.to raise_error
      end
    end
  end

  describe 'POST remove_exhibit' do
    let(:exhibit) { FactoryGirl.create(:exhibit) }
    let(:exhibition) { FactoryGirl.create(:exhibition) }

    before(:each) do
      exhibition.exhibits << exhibit
      post :remove_exhibit, id: exhibition.id, exhibit_id: exhibit.id
    end

    it 'should remove exhibit' do
      expect(exhibition.exhibits).not_to include(exhibit)
    end

    it 'sets flash message' do
      expect(flash[:success]).not_to be_nil
    end

    it 'redirects to exhibition' do
      expect(response).to redirect_to(exhibition)
    end
  end

end
