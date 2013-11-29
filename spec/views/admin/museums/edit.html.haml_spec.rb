require 'spec_helper'

describe "admin/museums/edit" do
  let!(:museum) { Museum.create(name: 'Name', address: 'Lviv') }
  before(:each) do
    assign(:museum, museum)
    render
  end

  it "renders the edit exhibition form" do
    expect(rendered).to have_selector("form#edit_museum_#{museum.id}")
  end

  it 'has name field' do
    expect(rendered).to have_selector("#museum_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#museum_address")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Update Museum")
  end
end
