class AdminPagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @exhibits = Exhibit.all
    @exhibitions = Exhibition.all
  end
end
