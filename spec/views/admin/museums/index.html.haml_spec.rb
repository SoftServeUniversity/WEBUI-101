require 'spec_helper'

describe "admin/museums/index" do
  let!(:museum) { Museum.create(name: 'Name', address: 'Lviv') }
  before(:each) do
    assign(:museums, Museum.all)
    render
  end

  it "has title" do
    expect(rendered).to have_content('Listing museums')
  end
  it 'renders list of museums' do
    expect(rendered).to have_content(museum.name)
  end

end
