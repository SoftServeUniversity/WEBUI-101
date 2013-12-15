require 'spec_helper'

describe 'search/_article.html.haml' do
  before :each do
    view.stub(:result).and_return(stub_model(Article, title: "L'etranger", content: 'Probably the best book ever...'))
    render
  end

  it 'renders link to found article' do
    expect(rendered).to have_link("L'etranger")
  end

  it 'renders content of found article' do
    expect(rendered).to have_content('Probably the best book ever...')
  end
end
