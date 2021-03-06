class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    if params[:search].present?
      @search = Article.search do
        fulltext params[:search] { boost_fields :title => 2.0 }
        paginate page: params[:page], per_page: 10
      end
      @articles = @search.results

    else
      @articles = Article.where(add_to_menu: false).page(params[:page]).per(10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show; end

  private

    def set_article
      @article = Article.friendly.find(params[:id])
    end

end
