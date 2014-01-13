require 'spec_helper'

describe ArticlesController do
  let(:article) { FactoryGirl.create(:article, add_to_menu: false) }
  describe "GET index" do
    it "assigns all articles as @articles" do
      get :index, {}
      assigns(:articles).should eq([article])
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article =FactoryGirl.create(:article)
      get :show, {:id => article.to_param}
      assigns(:article).should eq(article)
    end
  end
end
