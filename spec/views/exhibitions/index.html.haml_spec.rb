require 'spec_helper'

describe "admin/exhibitions/index" do
  let!(:exhibition1) { stub_model(Exhibition, name: 'Blanche') }
  let!(:exhibition2) { stub_model(Exhibition, name: 'Noir') }
  before(:each) do
    assign(:exhibitions, Kaminari.paginate_array([exhibition1, exhibition2]).page(1) )
  end

  it "renders a list of exhibitions" do
    render
    expect(rendered).to have_content(exhibition1.name, exhibition2.name)
  end
end
