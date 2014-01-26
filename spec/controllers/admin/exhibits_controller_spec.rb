require 'spec_helper'
describe Admin::ExhibitsController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:exhibit) }
  let(:exhibit) { FactoryGirl.create(:exhibit) }
  let(:valid_session) { {} }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET index" do
    it "assigns all exhibits as @exhibits" do
      exhibit = FactoryGirl.create(:exhibit)
      user.exhibits << exhibit
      get :index, {}, valid_session
      expect(assigns(:exhibits)).to eq(Kaminari.paginate_array(Exhibit.added_by(user)).page(1) )
    end
  end


  describe "GET show" do
    it "assigns the requested exhibit as @exhibit" do
      exhibit = FactoryGirl.create(:exhibit)
      get :show, {:id => exhibit.to_param}, valid_session
      assigns(:exhibit).should eq(exhibit)
    end
  end

  describe "GET new" do
    it "assigns a new exhibit as @exhibit" do
      get :new, {}, valid_session
      assigns(:exhibit).should be_a_new(Exhibit)
    end
  end

  describe "GET edit" do
    it "assigns the requested exhibit as @exhibit" do
      exhibit = FactoryGirl.create(:exhibit)
      get :edit, {:id => exhibit.to_param}, valid_session
      assigns(:exhibit).should eq(exhibit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Exhibit" do
        expect {
          post :create, exhibit: FactoryGirl.attributes_for(:exhibit)
        }.to change(Exhibit, :count).by(1)
      end

      it "assigns a newly created exhibit as @exhibit" do
        post :create, exhibit: FactoryGirl.attributes_for(:exhibit)
        assigns(:exhibit).should be_a(Exhibit)
        assigns(:exhibit).should be_persisted
      end

      it "redirects to the created exhibit" do
        post :create, exhibit: FactoryGirl.attributes_for(:exhibit)
        response.should redirect_to ([:admin, Exhibit.last])
      end

      it 'calls notify_moderator' do
        mail = double(ModeratorNotifier, deliver: true)
        ModeratorNotifier.should_receive(:notify_moderator).and_return(mail)
        post :create, exhibit: valid_attributes
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved exhibit as @exhibit" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibit.any_instance.stub(:save).and_return(false)
        post :create, {:exhibit => { "name" => "invalid value" }}, valid_session
        assigns(:exhibit).should be_a_new(Exhibit)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Exhibit.any_instance.stub(:save).and_return(false)
        post :create, {:exhibit => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end



  describe "DELETE destroy" do
    before :each do
      user.exhibits << exhibit
    end

    it "deletes the exhibit" do
      expect{
        delete :destroy, id: exhibit
      }.to change(Exhibit,:count).by(-1)
    end

    it "redirects to the exhibits list" do

      delete :destroy, id: exhibit
      response.should redirect_to admin_exhibits_url
    end

    it 'calls notify_moderator' do
      mail = double(ModeratorNotifier, deliver: true)
      ModeratorNotifier.should_receive(:notify_moderator).and_return(mail)
      delete :destroy, id: exhibit.to_param
    end
  end


end
