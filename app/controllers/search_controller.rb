class SearchController < ApplicationController

  def index
    if params[:search] && params[:search][:q].present?
      @search = Kaminari.paginate_array(Searchable.find(params[:search][:q])).page(params[:page]).per(10)
    else
      render :index
    end
  end
end
