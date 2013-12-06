require 'spec_helper'

describe "admin/properties/edit" do
  before(:each) do
    @property = assign(:property, stub_model(Property,
      :title => "MyString",
      :value => "MyText"
    ))
  end

  it "renders the edit property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_property_path(@property), "post" do
      assert_select "input#property_title[name=?]", "property[title]"
      assert_select "textarea#property_value[name=?]", "property[value]"
    end
  end
end
