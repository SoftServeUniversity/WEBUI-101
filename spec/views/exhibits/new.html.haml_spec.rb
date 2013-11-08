require 'spec_helper'

describe "exhibits/new" do
  before(:each) do
    assign(:exhibit, stub_model(Exhibit,
      :name => "MyString",
      :registration_number => "MyString",
      :fund_creator => "MyString",
      :opportunity_for_transportation => "MyString",
      :the_degree_of_preservation => "MyString",
      :authenticity => false,
      :the_electronic_version => false,
      :size => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new exhibit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exhibits_path, "post" do
      assert_select "input#exhibit_name[name=?]", "exhibit[name]"
      assert_select "input#exhibit_registration_number[name=?]", "exhibit[registration_number]"
      assert_select "input#exhibit_fund_creator[name=?]", "exhibit[fund_creator]"
      assert_select "input#exhibit_opportunity_for_transportation[name=?]", "exhibit[opportunity_for_transportation]"
      assert_select "input#exhibit_the_degree_of_preservation[name=?]", "exhibit[the_degree_of_preservation]"
      assert_select "input#exhibit_authenticity[name=?]", "exhibit[authenticity]"
      assert_select "input#exhibit_the_electronic_version[name=?]", "exhibit[the_electronic_version]"
      assert_select "input#exhibit_size[name=?]", "exhibit[size]"

    end
  end
end
