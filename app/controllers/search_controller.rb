class SearchController < ApplicationController

  def index
    if params[:search] && params[:search][:q].present?
      @search = Kaminari.paginate_array(Searchable.find(params[:search][:q])).page(params[:page]).per(10)
      @count = Searchable.count_results
    elsif params[:search] && params[:search][:q].empty?
      flash.now[:info] = 'Specify a search term please.'
    else
      render :index
    end
  end
end
