require 'spec_helper'

describe Admin::ArticlesController do
  let(:valid_attributes) { { "title" => "MyString" } }
  before(:each) { @article = FactoryGirl.create(:article)}
  let(:valid_session) { {} }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET index" do
    it "assigns all articles as @articles" do

      get :index, {}, valid_session
      assigns(:articles).should eq([@article])
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article =FactoryGirl.create(:article)
      get :show, {:id => article.to_param}, valid_session
      assigns(:article).should eq(article)
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      get :new, {}, valid_session
      assigns(:article).should be_a_new(Article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = FactoryGirl.create(:article)
      get :edit, {:id => article.to_param}, valid_session
      assigns(:article).should eq(article)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new article" do
        expect {
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, article: FactoryGirl.attributes_for(:article)
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end

      it "redirects to the created article" do
        post :create, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to ([:admin, Article.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:article => { "name" => "invalid value" }}, valid_session
        assigns(:article).should be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:article => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end



  describe "DELETE destroy" do


    it "deletes the article" do
      expect{
        delete :destroy, id: @article
      }.to change(Article,:count).by(-1)
    end

    it "redirects to the articles list" do

      delete :destroy, id: @article
      response.should redirect_to admin_articles_url
    end
  end


end
