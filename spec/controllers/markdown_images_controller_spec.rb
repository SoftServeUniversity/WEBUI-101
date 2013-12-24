require 'spec_helper'
describe Admin::MarkdownImagesController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:markdown_image) }
  let(:markdown_image) { FactoryGirl.create(:markdown_image) }
  let(:valid_session) { {} }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET index" do
    it "assigns all markdown_images as @markdown_images" do

      get :index, {}, valid_session
      assigns(:markdown_images).should eq([markdown_image])
    end
  end


  describe "GET new" do
    it "assigns a new markdown_image as @markdown_image" do
      get :new, {}, valid_session
      assigns(:markdown_image).should be_a_new(MarkdownImage)
    end
  end

  describe "GET edit" do
    it "assigns the requested markdown_image as @markdown_image" do
      markdown_image = FactoryGirl.create(:markdown_image)
      get :edit, {:id => markdown_image.to_param}, valid_session
      assigns(:markdown_image).should eq(markdown_image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MarkdownImage" do
        expect {
          post :create, markdown_image: FactoryGirl.attributes_for(:markdown_image)
        }.to change(MarkdownImage, :count).by(1)
      end

      it "assigns a newly created markdown_image as @markdown_image" do
        post :create, markdown_image: FactoryGirl.attributes_for(:markdown_image)
        assigns(:markdown_image).should be_a(MarkdownImage)
        assigns(:markdown_image).should be_persisted
      end

      it "redirects to the created markdown_image" do
        post :create, markdown_image: FactoryGirl.attributes_for(:markdown_image)
        response.should redirect_to ([:admin, MarkdownImage.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved markdown_image as @markdown_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        MarkdownImage.any_instance.stub(:save).and_return(false)
        post :create, {:markdown_image => { "name" => "invalid value" }}, valid_session
        assigns(:markdown_image).should be_a_new(MarkdownImage)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MarkdownImage.any_instance.stub(:save).and_return(false)
        post :create, {:markdown_image => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end



  describe "DELETE destroy" do

    it "redirects to the markdown_images list" do

      delete :destroy, id: markdown_image
      response.should redirect_to admin_markdown_images_url
    end

  end


end
