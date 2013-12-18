class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    if params[:search].present?
      @search = Article.search do
        fulltext params[:search] do
          boost_fields :title => 2.0
        end
        paginate page: params[:page], per_page: 1
      end
      @articles = @search.results

    else
      @articles = Article.all.page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

end
