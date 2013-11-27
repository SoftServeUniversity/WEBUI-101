require 'spec_helper'

describe "admin/exhibitions/index" do
  before(:each) do
    assign(:exhibitions, [
      stub_model(Exhibition,
        :name => "Name",
        :description => "MyText",
        :adress => "Adress",
        #:latitude => 1.5,
        #:longitude => 1.5,
        :virtual => false
      ),
      stub_model(Exhibition,
        :name => "Name",
        :description => "MyText",
        :adress => "Adress",
        #:latitude => 1.5,
       #:longitude => 1.5,
        :virtual => false
      )
    ])
  end

  it "renders a list of exhibitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    #assert_select "tr>td", :text => 1.5.to_s, :count => 2
    #assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
