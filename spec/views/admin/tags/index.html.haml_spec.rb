require 'spec_helper'

describe "admin/tags/index" do
  let!(:tag1) { stub_model(Tag, name: 'Tag1') }
  let!(:tag2) { stub_model(Tag, name: 'Tag2') }
  before(:each) do
    assign(:tags, Kaminari.paginate_array([tag1, tag2]).page(1) )
  end

  it "renders a list of tags" do
    render
    expect(rendered).to have_content('Tag1', 'Tag2')
  end
end
