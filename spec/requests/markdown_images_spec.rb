require 'spec_helper'

describe "MarkdownImage" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    sign_in(user)
  end

  subject { page }

  describe "markdown_images" do
    before { visit  admin_markdown_images_path }
    it { should have_content('Listing markdown_images') }
  end

  describe "New markdown_image" do
    before { visit new_admin_markdown_image_path }
    it { should have_content('New markdown_image')}
  end

end
