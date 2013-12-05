require 'spec_helper'

describe "properties/new" do
  before(:each) do
    assign(:property, stub_model(Property,
      :title => "MyString",
      :value => "MyText"
    ).as_new_record)
  end

  it "renders new property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", properties_path, "post" do
      assert_select "input#property_title[name=?]", "property[title]"
      assert_select "textarea#property_value[name=?]", "property[value]"
    end
  end
end
