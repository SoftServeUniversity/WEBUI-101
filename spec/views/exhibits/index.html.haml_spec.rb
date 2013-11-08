require 'spec_helper'

describe "exhibits/index" do
  before(:each) do
    assign(:exhibits, [
      stub_model(Exhibit,
        :name => "Name",
        :registration_number => "Registration Number",
        :fund_creator => "Fund Creator",
        :opportunity_for_transportation => "Opportunity For Transportation",
        :the_degree_of_preservation => "The Degree Of Preservation",
        :authenticity => false,
        :the_electronic_version => false,
        :size => "Size",
        :description => "MyText"
      ),
      stub_model(Exhibit,
        :name => "Name",
        :registration_number => "Registration Number",
        :fund_creator => "Fund Creator",
        :opportunity_for_transportation => "Opportunity For Transportation",
        :the_degree_of_preservation => "The Degree Of Preservation",
        :authenticity => false,
        :the_electronic_version => false,
        :size => "Size",
      )
    ])
  end

  it "renders a list of exhibits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Number".to_s, :count => 2
    assert_select "tr>td", :text => "Fund Creator".to_s, :count => 2
    assert_select "tr>td", :text => "Opportunity For Transportation".to_s, :count => 2
    assert_select "tr>td", :text => "The Degree Of Preservation".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2

  end
end
