require 'spec_helper'

describe "museums/new" do
  before(:each) do
    assign(:museum, stub_model(Museum,
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new museum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", museums_path, "post" do
      assert_select "input#museum_name[name=?]", "museum[name]"
      assert_select "input#museum_address[name=?]", "museum[address]"
      assert_select "input#museum_latitude[name=?]", "museum[latitude]"
      assert_select "input#museum_longitude[name=?]", "museum[longitude]"
    end
  end
end
