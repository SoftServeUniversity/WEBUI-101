class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show]
  before_action :set_search, only: [:index]

  def index
    if params[:search].present? || params[:month].present?
      @exhibitions = @search.results
    else
      @exhibitions = Exhibition.all.page(params[:page]).per(5)
    end
  end

  def show; end
  private
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

    def set_search
      @search = Exhibition.search do
        fulltext params[:search] { boost_fields name: 2.0 } if params[:search].present?
        facet :exhibition_month
        with(:exhibition_month, params[:month]) if params[:month].present?
        paginate page: params[:page], per_page: 5
      end
    end

end
