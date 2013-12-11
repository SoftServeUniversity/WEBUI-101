class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show]

  # GET /exhibitions
  # GET /exhibitions.json
  def index
    @exhibitions = Exhibition.all.page(params[:page]).per(5)
  end

  # GET /exhibitions/1
  # GET /exhibitions/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

end
