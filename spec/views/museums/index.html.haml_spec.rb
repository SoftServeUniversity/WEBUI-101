require 'spec_helper'

describe "museums/index" do
  before(:each) do
    assign(:museums, [
      stub_model(Museum,
        :name => "Name",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      stub_model(Museum,
        :name => "Name",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of museums" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 4
  end
end
