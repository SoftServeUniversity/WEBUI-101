require 'spec_helper'

describe "admin/exhibitions/edit" do
  let!(:exhibition) { FactoryGirl.create(:exhibition) }
  before(:each) do
    assign(:exhibition, exhibition)
    render
  end

  it "renders the edit exhibition form" do
    expect(rendered).to have_selector("form#edit_exhibition_#{exhibition.id}")
  end

  it 'has name field' do
    expect(rendered).to have_selector("#exhibition_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#exhibition_description")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Update Exhibition")
  end
end
