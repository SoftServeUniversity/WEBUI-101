class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show]

    def index
    @exhibitions = Exhibition.all.page(params[:page]).per(5)
  end

  def show

  end
  private
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

end
