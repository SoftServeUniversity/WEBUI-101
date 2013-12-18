require 'spec_helper'

describe 'search/_exhibit.html.haml' do
  before :each do
    view.stub(:result).and_return(stub_model(Exhibit, name: 'Scout',
                                                      description: 'Scout'))
    render
  end

  it 'renders link to found exhibit' do
    expect(rendered).to have_link('Scout')
  end

  it 'renders description of found exhibition' do
    expect(rendered).to match /Scout/
  end
end
