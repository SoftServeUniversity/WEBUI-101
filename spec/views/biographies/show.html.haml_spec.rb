require 'spec_helper'

describe "admin/biographies/show" do
  before(:each) do
    @biography = assign(:biography, stub_model(Biography,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
