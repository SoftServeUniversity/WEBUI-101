require 'spec_helper'

describe "admin/museums/new" do
  before(:each) do
    museum = Museum.new
    assign(:museum, museum)
    render
  end

  it "renders new exhibition form" do
    expect(rendered).to have_selector('form#new_museum')
  end
  it 'has name field' do
    expect(rendered).to have_selector("#museum_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#museum_address")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Create Museum")
  end
end
