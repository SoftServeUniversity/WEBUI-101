require 'spec_helper'

describe "admin/exhibitions/show" do
  before(:each) do
    @exhibition = assign(:exhibition, stub_model(Exhibition,
      :name => "Name",
      :description => "MyText",
      :adress => "Adress",
      #:latitude => 1.5,
      #:longitude => 1.5,
      :virtual => false
    ))
  end

  xit "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Adress/)
    #rendered.should match(/1.5/)
    #rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
