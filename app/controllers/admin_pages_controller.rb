class AdminPagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @exhibits = Exhibit.all.page(params[:page]).per(10)
    @exhibitions = Exhibition.all.page(params[:page]).per(10)
  end
end
