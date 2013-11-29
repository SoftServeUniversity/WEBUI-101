require 'spec_helper'

describe "admin/tags/new" do
  before(:each) do
    tag = Tag.new
    assign(:tag, tag)
    render
  end

  it "renders new exhibition form" do
    expect(rendered).to have_selector('form#new_tag')
  end
  it 'has name field' do
    expect(rendered).to have_selector("#tag_name")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Create Tag")
  end
end
