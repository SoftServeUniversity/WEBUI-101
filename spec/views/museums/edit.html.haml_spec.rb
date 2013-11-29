require 'spec_helper'

describe "museums/edit" do
  before(:each) do
    @museum = assign(:museum, stub_model(Museum,
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit museum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", museum_path(@museum), "post" do
      assert_select "input#museum_name[name=?]", "museum[name]"
      assert_select "input#museum_address[name=?]", "museum[address]"
      assert_select "input#museum_latitude[name=?]", "museum[latitude]"
      assert_select "input#museum_longitude[name=?]", "museum[longitude]"
    end
  end
end
