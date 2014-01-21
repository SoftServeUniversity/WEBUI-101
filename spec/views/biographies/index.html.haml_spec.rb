require 'spec_helper'

describe "admin/biographies/index" do
  before(:each) do
    assign(:biographies, Kaminari.paginate_array([
          stub_model(Biography,
            :name => "Name",
            :description => "MyText"
          ),
          stub_model(Biography,
            :name => "Name",
            :description => "MyText"
          )
        ]).page(1))
  end

  it "renders a list of biographies" do
    render
    expect(rendered).to have_content('Name')
  end
end
