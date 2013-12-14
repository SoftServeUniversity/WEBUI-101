class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show]

  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all.page(params[:page]).per(10)
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
