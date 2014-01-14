class BiographiesController < ApplicationController
  before_action :set_biography, only: [:show]

  def index
    if params[:search].present?
      @search = Biography.search do
        fulltext params[:search] { boost_fields :name => 2.0 }
        paginate page: params[:page], per_page: 10
      end
      @biographies = @search.results
    else
      @biographies = Biography.all.page(params[:page]).per(10)
    end
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biography
      @biography = Biography.find(params[:id])
    end
end
