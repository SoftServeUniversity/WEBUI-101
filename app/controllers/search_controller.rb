class SearchController < ApplicationController
  def index
    @search = Exhibition.search do
      fulltext params[:search][:query] if params[:search][:query]
    end

    @results = @search.results if @search.results
  end
end
