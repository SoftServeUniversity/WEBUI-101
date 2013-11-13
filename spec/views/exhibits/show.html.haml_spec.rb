require 'spec_helper'

describe "exhibits/show" do
  before(:each) do
    @exhibit = assign(:exhibit, stub_model(Exhibit,
      :name => "Name",
      :registration_number => "Registration Number",
      :fund_creator => "Fund Creator",
      :opportunity_for_transportation => "Opportunity For Transportation",
      :the_degree_of_preservation => "The Degree Of Preservation",
      :authenticity => false,
      :the_electronic_version => false,
      :size => "Size",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Registration Number/)
    rendered.should match(/Fund Creator/)
    rendered.should match(/Opportunity For Transportation/)
    rendered.should match(/The Degree Of Preservation/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Size/)
    rendered.should match(/MyText/)
  end
end
