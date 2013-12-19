class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show]

  def index
    if params[:search].present?
      @search = Exhibition.search do
        fulltext params[:search] do
          boost_fields name: 2.0
        end
        paginate page: params[:page], per_page: 5
      end
      @exhibitions = @search.results

    else
      @exhibitions = Exhibition.all.page(params[:page]).per(5)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show; end
  private
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

end
