require 'spec_helper'

describe "admin/exhibitions/new" do
  before(:each) do
    exhibition = Exhibition.new
    assign(:exhibition, exhibition)
    render
  end

  it "renders new exhibition form" do
    expect(rendered).to have_selector('form#new_exhibition')
  end
  it 'has name field' do
    expect(rendered).to have_selector("#exhibition_name")
  end
  it 'has description field' do
    expect(rendered).to have_selector("#exhibition_description")
  end
  it 'has submit button' do
    expect(rendered).to have_button("Create Exhibition")
  end
end
