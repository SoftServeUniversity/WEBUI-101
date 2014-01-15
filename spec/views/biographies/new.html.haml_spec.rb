require 'spec_helper'

describe "admin/biographies/new" do
  let(:biography) { Biography.new }

  before :each do
    assign(:biography, biography)
    assign(:markdown_images, MarkdownImage.last(10))
    assign(:markdown_image, MarkdownImage.new)
    render
  end

  it "renders new biography form" do
    expect(rendered).to have_selector('#new_biography')
  end
  it 'has name field' do
    expect(rendered).to have_selector("#biography_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#wmd-input")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Create Biography")
  end
end
