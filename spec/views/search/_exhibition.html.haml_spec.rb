require 'spec_helper'

describe 'search/_exhibition.html.haml' do
  before :each do
    view.stub(:result).and_return(stub_model(Exhibition, name: 'Scouts',
                                                         description: 'Scouts gone wild',
                                                         adress: 'Lviv'))
    render
  end

  it 'renders link to found exhibition' do
    expect(rendered).to have_link('Scouts')
  end

  it 'renders description of found exhibition' do
    expect(rendered).to have_content('Scouts gone wild')
  end

  it 'renders address of found exhibition' do
    expect(rendered).to have_content('Lviv')
  end
end
