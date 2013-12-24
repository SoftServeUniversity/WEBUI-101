class TagsController < ApplicationController
  before_action :find_model, :set_tag, only: [:show, :list, :timeline]

  def index
    @tags = Tag.all.page(params[:page]).per(12)
  before_action :find_model, :set_tag, only: [:show, :list]

  def index
    @tags = Tag.all.page(params[:page]).per(10)
  end

  def show; end
  def list; end
  def timeline; end


  private
  def find_model
    @model = Tag.find(params[:id]) if params[:id]
    @exhibits = @model.exhibits.page(params[:page]).per(12)
    @exhibits = @model.exhibits.page(params[:page]).per(10)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end

end
