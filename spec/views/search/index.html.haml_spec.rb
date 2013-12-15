require 'spec_helper'

describe 'search/index.html.haml' do
  describe 'when search results are not present' do
    before :each do
      render
    end

    it 'has search form' do
      expect(rendered).to have_selector('form.search-form')
    end

    it 'has search input' do
      expect(rendered).to have_selector('input#search_q')
    end

    it 'has search button' do
      expect(rendered).to have_selector('.search-button')
    end
  end

  describe 'when search results are present' do
    before :each do
      assign(:search, Kaminari.paginate_array([stub_model(Exhibit),
                                               stub_model(Exhibition),
                                               stub_model(Article)]).page(1))
    end

    it 'renders _exhibit.html.haml partial' do
      stub_template 'search/_exhibit.html.haml' => 'Exhibit'
      render
      expect(rendered).to match /Exhibit/
    end
    it 'renders _exhibition.html.haml partial' do
      stub_template 'search/_exhibition.html.haml' => 'Exhibition'
      render
      expect(rendered).to match /Exhibition/
    end
    it 'renders _article.html.haml. partial' do
      stub_template 'search/_article.html.haml' => 'Article'
      render
      expect(rendered).to match /Article/
    end
  end
end
