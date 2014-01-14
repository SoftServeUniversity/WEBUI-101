class Admin::BiographiesController < AdminController
  before_action :set_biography, only: [:show, :edit, :update, :destroy]
  before_action :set_markdown, only: [:new, :edit]

  # GET /biographies
  # GET /biographies.json
  def index
    @biographies = Biography.added_by(current_admin_user).page(params[:page]).per(10)
  end

  # GET /biographies/1
  # GET /biographies/1.json
  def show
  end

  # GET /biographies/new
  def new
    @biography = Biography.new
  end



  # GET /biographies/1/edit
  def edit
  end

  # POST /biographies
  # POST /biographies.json
  def create
    @biography = Biography.new(biography_params)
    respond_to do |format|
      if @biography.save
        current_admin_user.biographies << @biography
        format.html { redirect_to [:admin, @biography], notice: 'Biography was successfully created.' }
        format.json { render action: 'show', status: :created, location: @biography }
      else
        format.html { render action: 'new' }
        format.json { render json: @biography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biographies/1
  # PATCH/PUT /biographies/1.json
  def update
    respond_to do |format|
      if @biography.update(biography_params)
        format.html { redirect_to [:admin, @biography], notice: 'Biography was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @biography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biographies/1
  # DELETE /biographies/1.json
  def destroy
    @biography.destroy
    respond_to do |format|
      format.html { redirect_to admin_biographies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biography
      @biography = Biography.find(params[:id])
    end

    def set_markdown
      @markdown_images=MarkdownImage.last(10)
      @markdown_image=MarkdownImage.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biography_params
      params.require(:biography).permit(:name, :description, :tags_string)
    end
end
