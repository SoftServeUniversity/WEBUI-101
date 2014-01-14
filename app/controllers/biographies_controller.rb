class BiographiesController < ApplicationController
  before_action :set_biography, only: [:show]

  # GET /biographies
  # GET /biographies.json
  def index
    @biographies = Biography.all.page(params[:page]).per(10)
  end

  # GET /biographies/1
  # GET /biographies/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biography
      @biography = Biography.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biography_params
      params.require(:biography).permit(:name, :description)
    end
end
