require 'spec_helper'

describe SearchController do
  describe 'GET index' do
    context 'when params[:search] is empty' do
      it 'renders index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when params[:search][:q] is empty' do
      let(:query) { {q: ''} }
      before :each do
        get :index, search: query
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end

      it 'sets flash message' do
        expect(flash.now[:info]).not_to be_empty
      end
    end

    context 'when params[:search][:q] is present' do
      let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'sunspot') }

      it 'performs a search' do
        get :index, search: {q: 'sunspot'}
        Sunspot.session.should have_search_params(:fulltext, 'sunspot')
      end

      it 'assigns @search variable' do
        Searchable.stub(:find).and_return([exhibition])
        get :index, search: {q: 'sunspot'}
        expect(assigns(:search)).to eq(Kaminari.paginate_array([exhibition]).page(1))
      end

      it 'assigns @count variable' do
        Searchable.stub(:count_results).and_return(1)
        get :index, search: {q: 'sunspot'}
        expect(assigns(:count)).to eq(1)
      end
    end
  end
end
