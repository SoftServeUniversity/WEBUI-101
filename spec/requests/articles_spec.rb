require 'spec_helper'

describe "Articles" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  subject { page }

  describe "articles" do
    before { visit  admin_articles_path }
    it { should have_content('Listing articles') }
  end

  describe "New article" do
    before { visit new_admin_article_path }
    it { should have_content('New article')}
  end

end
