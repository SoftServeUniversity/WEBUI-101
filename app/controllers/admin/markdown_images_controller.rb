class  Admin::MarkdownImagesController < AdminController
  before_action :set_markdown_image, only: [:show, :edit, :update, :destroy]

  # GET /markdown_images
  # GET /markdown_images.json
  def index
    @markdown_images = MarkdownImage.all
  end

  # GET /markdown_images/1
  # GET /markdown_images/1.json
  def show
  end

  # GET /markdown_images/new
  def new
    @markdown_image = MarkdownImage.new
  end

  # GET /markdown_images/1/edit
  def edit
  end

  # POST /markdown_images
  # POST /markdown_images.json
  def create
    @markdown_image = MarkdownImage.new(markdown_image_params)

    respond_to do |format|
      if @markdown_image.save
        format.js
        format.html { redirect_to [:admin, @markdown_image], notice: 'Markdown image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @markdown_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @markdown_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markdown_images/1
  # PATCH/PUT /markdown_images/1.json
  def update
    respond_to do |format|
      if @markdown_image.update(markdown_image_params)
        format.html { redirect_to @markdown_image, notice: 'Markdown image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @markdown_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markdown_images/1
  # DELETE /markdown_images/1.json
  def destroy
    @markdown_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_markdown_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_markdown_image
      @markdown_image = MarkdownImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def markdown_image_params
      params.require(:markdown_image).permit(:image)
    end
end
