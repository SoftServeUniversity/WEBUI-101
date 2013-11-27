class MuseumsController < ApplicationController
  before_action :set_museum, only: [:show, :edit, :update, :destroy]

  # GET /museums
  # GET /museums.json
  def index
    @museums = Museum.all
  end

  # GET /museums/1
  # GET /museums/1.json
  def show
  end

  # GET /museums/new
  def new
    @museum = Museum.new
  end

  # GET /museums/1/edit
  def edit
  end

  # POST /museums
  # POST /museums.json
  def create
    @museum = Museum.new(museum_params)

    respond_to do |format|
      if @museum.save
        format.html { redirect_to @museum, notice: 'Museum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @museum }
      else
        format.html { render action: 'new' }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /museums/1
  # PATCH/PUT /museums/1.json
  def update
    respond_to do |format|
      if @museum.update(museum_params)
        format.html { redirect_to @museum, notice: 'Museum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /museums/1
  # DELETE /museums/1.json
  def destroy
    @museum.destroy
    respond_to do |format|
      format.html { redirect_to museums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_museum
      @museum = Museum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def museum_params
      params.require(:museum).permit(:name, :address, :latitude, :longitude)
    end
end
