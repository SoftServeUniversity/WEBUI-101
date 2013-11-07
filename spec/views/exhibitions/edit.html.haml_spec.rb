require 'spec_helper'

describe "exhibitions/edit" do
  before(:each) do
    @exhibition = assign(:exhibition, stub_model(Exhibition,
      :name => "MyString",
      :description => "MyText",
      :adress => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :virtual => false
    ))
  end

  it "renders the edit exhibition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exhibition_path(@exhibition), "post" do
      assert_select "input#exhibition_name[name=?]", "exhibition[name]"
      assert_select "textarea#exhibition_description[name=?]", "exhibition[description]"
      assert_select "input#exhibition_adress[name=?]", "exhibition[adress]"
      assert_select "input#exhibition_latitude[name=?]", "exhibition[latitude]"
      assert_select "input#exhibition_longitude[name=?]", "exhibition[longitude]"
      assert_select "input#exhibition_virtual[name=?]", "exhibition[virtual]"
    end
  end
end
