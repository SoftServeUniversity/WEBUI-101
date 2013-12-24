class Admin::ExhibitionsController < AdminController
  before_action :set_exhibition, except: [:index, :create, :new]
  # GET /exhibitions
  # GET /exhibitions.json
  def index
    @exhibitions = Exhibition.added_by(current_admin_user).page(params[:page]).per(10)
  end

  # GET /exhibitions/1
  # GET /exhibitions/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf
    end
  end

  # GET /exhibitions/new
  def new
    @exhibition = Exhibition.new
  end

  # GET /exhibitions/1/edit
  def edit
    @versions = @exhibition.versions
    @exhibition = @exhibition.versions[params[:version].to_i].reify if params[:version]
  end

  # POST /exhibitions
  # POST /exhibitions.json
  def create
    @exhibition = Exhibition.new(exhibition_params)
    respond_to do |format|
      if @exhibition.save
        current_admin_user.exhibitions << @exhibition
        ModeratorNotifier.notify_moderator(@exhibition, action_name).deliver
        format.html { redirect_to [:admin, @exhibition], notice: 'Exhibition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exhibition }
      else
        format.html { render action: 'new' }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibitions/1
  # PATCH/PUT /exhibitions/1.json
  def update
    respond_to do |format|
      if @exhibition.update(exhibition_params)
        ModeratorNotifier.notify_moderator(@exhibition, action_name).deliver
        format.html { redirect_to [:admin, @exhibition], notice: 'Exhibition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibitions/1
  # DELETE /exhibitions/1.json
  def destroy
    @exhibition.destroy
    ModeratorNotifier.notify_moderator(@exhibition, action_name).deliver
    respond_to do |format|
      format.html { redirect_to admin_exhibitions_url }
      format.json { head :no_content }
    end
  end

  def add_exhibit
    @exhibit = Exhibit.find(params[:exhibition][:exhibit_ids])

    if @exhibit.available_for_dates?(@exhibition.start_date, @exhibition.end_date, @exhibition)
      @exhibition.exhibits << @exhibit
      flash[:success] = "Exhibit: #{@exhibit.name} was successfully added to #{@exhibition.name} exhibition!"
      redirect_to [:admin, @exhibition]
    else
      flash[:warning] = "Exhibit: #{@exhibit.name} is currently unavailable."
      redirect_to [:admin, @exhibition]
    end

    rescue ActiveRecord::RecordNotFound
      flash[:warning] = 'Please choose an exhibit first.'
      redirect_to :back
  end

  def remove_exhibit
    @exhibit = Exhibit.find(params[:exhibit_id])
    @exhibition.exhibits.delete(@exhibit)
    flash[:success] = "Exhibit: #{@exhibit.name} was successfully removed from #{@exhibition.name} exhibition."
    redirect_to [:admin, @exhibition]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibition_params
      params.require(:exhibition).permit(:name, :description, :start_date,
                                         :end_date, :adress, :latitude, :longitude, :virtual, :user_id)
    end
end
