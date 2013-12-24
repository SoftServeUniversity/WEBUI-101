require 'spec_helper'

describe "admin/tags/edit" do
  let!(:tag) { FactoryGirl.create(:tag) }
  before(:each) do
    assign(:tag, tag)
    render
  end

  it "renders the edit tag form" do
    expect(rendered).to have_selector("form#edit_tag_#{tag.id}")
  end
  it 'has tag name field' do
    expect(rendered).to have_selector("#tag_name")
  end
  it 'has tag name field' do
    expect(rendered).to have_button("Update Tag")
  end
end
