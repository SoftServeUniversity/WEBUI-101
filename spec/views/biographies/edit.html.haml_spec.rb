require 'spec_helper'

describe "admin/biographies/edit" do
  let(:biography) { FactoryGirl.create(:biography) }

  before :each do
    assign(:biography, biography)
    assign(:markdown_images, MarkdownImage.last(10))
    assign(:markdown_image, MarkdownImage.new)
    render
  end

  it "renders edit biography form" do
    expect(rendered).to have_selector("#edit_biography_#{biography.id}")
  end
  it 'has name field' do
    expect(rendered).to have_selector("#biography_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#wmd-input")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Update Biography")
  end
end
