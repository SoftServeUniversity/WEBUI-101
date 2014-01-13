require 'spec_helper'

describe "admin/biographies/index" do
  before(:each) do
    assign(:biographies, [
      stub_model(Biography,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Biography,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of biographies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
