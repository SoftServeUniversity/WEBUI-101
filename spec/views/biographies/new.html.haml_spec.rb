require 'spec_helper'

describe "biographies/new" do
  before(:each) do
    assign(:biography, stub_model(Biography,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new biography form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biographies_path, "post" do
      assert_select "input#biography_name[name=?]", "biography[name]"
      assert_select "textarea#biography_description[name=?]", "biography[description]"
    end
  end
end
