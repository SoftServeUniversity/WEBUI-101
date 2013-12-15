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
      let(:query) { {q: 'sunspot'} }
      let!(:exhibition) { FactoryGirl.create(:exhibition, name: 'sunspot') }
      before :each do
        get :index, search: query
      end

      it 'assigns @search variable' do
        expect(assigns(:search)).to eq([exhibition])
      end

      it 'assigns @count variable' do
        expect(assigns(:count)).to eq(1)
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
