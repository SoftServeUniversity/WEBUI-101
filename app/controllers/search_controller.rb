class SearchController < ApplicationController

  def index
    if params[:search] && params[:search][:q].present?
      @search_term = params[:search][:q]
      @search = Searchable.find(@search_term, params[:page])
    elsif params[:search] && params[:search][:q].empty?
      flash.now[:info] = 'Specify a search term please.'
    else
      render :index
    end
  end
end
