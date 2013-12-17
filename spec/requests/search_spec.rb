require 'spec_helper'

describe 'Search' do
  describe 'GET /search' do
    it 'renders search page' do
      visit '/'
      click_link 'Search'
      expect(current_path).to eq(search_index_path)
    end
  end

  describe 'search page' do
    let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'scout') }
    let!(:hits) { double('hits', current_page: 1, total_pages: 1, limit_value: 1) }
    let(:found) { double('Searchable', results: [exhibition], total: 1, hits: hits) }

    before :each do
      Searchable.stub(:find).and_return(found)
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
      let(:found) { double('Searchable', results: [], total: 1, hits: hits) }

      it 'informs about no found results' do
        within('p.help-block') do
          expect(page).to have_content('Nothing was found, please try again.')
        end
      end
    end
  end
end
