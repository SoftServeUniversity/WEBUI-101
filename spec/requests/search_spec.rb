require 'spec_helper'

describe 'Search' do
  let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'scout') }
  let!(:exhibit) { FactoryGirl.create(:exhibit, name: 'scout') }
  let!(:hits) { double('hits', current_page: 1, total_pages: 1, limit_value: 1) }
  let(:search) { double('Search', results: [exhibition], total: 1, hits: hits) }
  let!(:property) { FactoryGirl.create(:property) }


  describe 'GET /search' do
    it 'renders search page' do
      visit '/'
      click_link 'Search'
      expect(current_path).to eq(search_index_path)
    end
  end

  describe 'search page' do
    let(:search) { double('Search', results: [exhibition], total: 1, hits: hits) }

    before :each do
      Searchable.stub(:find).and_return(search)
      visit search_index_path
      fill_in 'search_q', with: 'scout'
      page.find('.search-button').click
    end

    context 'when results were found' do

      it 'renders found results' do
        expect(page).to have_content('scout')
      end

      it 'shows how many results were found' do
        within('p.help-block') do
          expect(page).to have_content(1)
        end
      end
    end

    context 'when no results were found' do
      let(:search) { double('Search', results: [], total: 1, hits: hits) }

      it 'informs about no found results' do
        within('p.help-block') do
          expect(page).to have_content('Nothing was found, please try again.')
        end
      end
    end
  end

  describe 'exhibits search' do
    before :each do
      visit exhibits_path
    end

    it 'has search form' do
      expect(page).to have_selector('form.search-form')
    end
    it 'has "show all" link' do
      expect(page).to have_link('show all')
    end

    describe 'when submiting search term', js: true do
      let(:search) { double('Search', results: [exhibit], hits: hits, total: 1)}

      before :each do
        Exhibit.stub(:search).and_return(search)
      end
      it 'performs search on Exhibit model' do
        fill_in 'search', with: 'scout'
        page.find('.search-button').click
        expect(page).to have_content('scout')
      end
    end
  end

  describe 'articles search' do
    before :each do
      visit articles_path
    end

    it 'has search form' do
      expect(page).to have_selector('form.search-form')
    end
    it 'has "show all" link' do
      expect(page).to have_link('show all')
    end

    describe 'when submiting search term', js: true do
      let!(:article) { FactoryGirl.create(:article, title: 'scout', add_to_menu: false) }
      let(:search) { double('Search', results: [article], hits: hits, total: 1)}

      before :each do
        Article.stub(:search).and_return(search)
      end
      it 'performs search on Article model' do
        fill_in 'search', with: 'scout'
        page.find('.search-button').click
        expect(page).to have_content('scout')
      end
    end
  end

  describe 'exhibitions search' do
    let!(:exhibition_1) { FactoryGirl.create(:exhibition, name: 'Scouts to the Rescue', start_date: '01/11/2013', end_date: '30/11/2013') }
    let!(:exhibition_2) { FactoryGirl.create(:exhibition, name: 'Sea scouts', start_date: '01/12/2013', end_date: '30/12/2013') }
    let(:search) { double('Search', results: [exhibition_1, exhibition_2], total: 1, hits: hits) }
    let(:row1) { double('row1', value: 'November 2013', count: 1) }
    let(:row2) { double('row2', value: 'December 2013', count: 1) }

    describe 'GET /exhibitions' do
      before :each do
        Exhibition.stub(:all).and_return(Kaminari.paginate_array([exhibition_1, exhibition_2]).page(1))
        Exhibition.stub(:search).and_return(search)
        search.stub_chain(:facet, :rows, :sort).and_return([row1, row2])
        visit exhibitions_path
      end
      it 'has search form' do
        expect(page).to have_selector('form.search-form')
      end
      it 'has "show all" link' do
        expect(page).to have_link('show all')
      end
      it 'has facets list' do
        within('.facets') do
          expect(page).to have_link('November 2013')
          expect(page).to have_link('December 2013')
        end
      end
    end

    describe 'filtering by facets', js: true do
      let(:search) { double('Search', results: [exhibition_1], total: 1, hits: hits) }

      before :each do
        Exhibition.stub(:search).and_return(search)
        search.stub_chain(:facet, :rows, :sort).and_return([row1])
        visit exhibitions_path
      end

      it 'shows matched results' do
        click_link 'November 2013'
        expect(page).to have_content('Scouts to the Rescue')
      end

      it "doesn't show unmatched results" do
        click_link 'November 2013'
        expect(page).not_to have_content('Sea scouts')
      end

      it 'displayes name of filter (month and year)' do
        click_link 'November 2013'
        within('strong') do
          expect(page).to have_content('November 2013')
        end
      end

      it 'has remove link' do
        click_link 'November 2013'
        expect(page).to have_link('remove')
      end
    end

    describe 'search by search term', js: true do
      let(:search) { double('Search', results: [exhibition_1], total: 1, hits: hits) }

      before :each do
        Exhibition.stub(:search).and_return(search)
        search.stub_chain(:facet, :rows, :sort).and_return([row1])
        visit exhibitions_path
        fill_in 'search', with: 'scouts'
        page.find('.search-button').click
      end

      it 'renders found results' do
        expect(page).to have_content('Scouts to the Rescue')
      end

      it 'has month filter' do
        expect(page).to have_content('November 2013')
      end
    end
  end
end
