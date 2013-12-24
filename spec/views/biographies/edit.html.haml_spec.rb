require 'spec_helper'

describe "biographies/edit" do
  before(:each) do
    @biography = assign(:biography, stub_model(Biography,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit biography form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", biography_path(@biography), "post" do
      assert_select "input#biography_name[name=?]", "biography[name]"
      assert_select "textarea#biography_description[name=?]", "biography[description]"
    end
  end
end
