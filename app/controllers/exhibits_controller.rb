class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show]

  # GET /exhibits
  # GET /exhibits.json
  def index
    if params[:search].present?
      @search = Exhibit.search do
        fulltext params[:search] do
          boost_fields name: 2.0
        end
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

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

end
