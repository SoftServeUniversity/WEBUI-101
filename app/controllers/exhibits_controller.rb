class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show]
  before_action :all_items, only: [:index, :list, :timeline]

  def index; end
  def list; end
  def timeline; end

  def show; end

   def audio
     if params[:search].present?
      @search = Exhibit.search do
        fulltext params[:search] { boost_fields name: 2.0 }
        paginate page: params[:page], per_page: 10
      end
      @exhibits = @search.results
    else
      @exhibits= Exhibit.includes(:tags).where(tags: { name: 'audio' }).page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html
      format.js
    end

  end

  def video
    if params[:search].present?
      @search = Exhibit.search do
        fulltext params[:search] { boost_fields name: 2.0 }
        paginate page: params[:page], per_page: 10
      end
      @exhibits = @search.results
    else
      @exhibits= Exhibit.includes(:tags).where(tags: { name: 'video' }).page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html
      format.js
    end

  end

  private

    def all_items
      if params[:search].present?
        @search = Exhibit.search do
          fulltext params[:search] { boost_fields name: 2.0 }
          paginate page: params[:page], per_page: 10
        end
        @exhibits = @search.results
      else
        @exhibits = Exhibit.all.page(params[:page]).per(10)
      end

      respond_to do |format|
        format.html
        format.js
        format.json
      end
    end

    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibit_params
      params.require(:exhibit).permit(:name, :registration_number, :date_of_receipt, :fund_creator,
                                      :opportunity_for_transportation, :the_degree_of_preservation,
                                      :tags_string, :biographies_string, :authenticity, :the_electronic_version, :size,
                                      :description, pictures_attributes: [:id, :name, :image])
    end

end
