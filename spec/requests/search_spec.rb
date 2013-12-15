require 'spec_helper'

describe 'Search' do
  describe 'GET /search' do
    it 'renders search page' do
      visit '/'
      click_link 'Пошук'
      expect(current_path).to eq(search_index_path)
    end
  end

  describe 'search page' do
    let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'scout') }
    let(:query) { 'scout' }

    before :each do
      visit search_index_path
      fill_in 'search_q', with: query
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
      let(:query) { 'blah' }

      it 'informs about no found results' do
        within('p.help-block') do
          expect(page).to have_content('Nothing was found, please try again.')
        end
      end
    end
  end
end
