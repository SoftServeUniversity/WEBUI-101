class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show]

  def index
    if params[:search].present?
      @search = Exhibit.search do
        fulltext params[:search] { boost_fields name: 2.0 }
        paginate page: params[:page], per_page: 10
      end
      @exhibits = @search.results
    else
      @exhibits = Exhibit.all.page(params[:page]).per(10)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show; end

  private

    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

end
