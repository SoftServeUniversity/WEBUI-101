class Admin::ExhibitsController < AdminController
  layout "admin"
  before_action :set_exhibit, only: [:show, :edit, :update, :destroy]
  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all.page(params[:page]).per(10)
  end

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show
  end

  # GET /exhibits/new
  def new
    @exhibit = Exhibit.new
    @exhibit.pictures.build
  end

  # GET /exhibits/1/edit
  def edit
    @exhibit.pictures.build
  end

  # POST  /exhibits
  # POST /exhibits.json
  def create
    @exhibit = Exhibit.new(exhibit_params)

    respond_to do |format|
      if @exhibit.save
        format.html { redirect_to [:admin, @exhibit], notice: 'Exhibit was successfully created.' }
        current_user.exhibits << @exhibit
        ModeratorNotifier.notify_moderator(@exhibit, action_name).deliver
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exhibit }
      else
        format.html { render action: 'new' }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibits/1
  # PATCH/PUT /exhibits/1.json
  def update
    respond_to do |format|
      if @exhibit.update(exhibit_params)
        format.html { redirect_to [:admin, @exhibit], notice: 'Exhibit was successfully updated.' }
        ModeratorNotifier.notify_moderator(@exhibit, action_name).deliver
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibits/1
  # DELETE /exhibits/1.json
  def destroy
    @exhibit.destroy
    ModeratorNotifier.notify_moderator(@exhibit, action_name).deliver
    respond_to do |format|
      format.html { redirect_to admin_exhibits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibit_params
      params.require(:exhibit).permit(:name, :registration_number, :date_of_receipt, :fund_creator,
                                      :opportunity_for_transportation, :the_degree_of_preservation,
                                      :tags_string, :authenticity, :the_electronic_version, :size,
                                      :description, pictures_attributes: [:id, :name, :image, :_destroy])
    end

end