class SearchController < ApplicationController

  def index
    if !params[:search]
      render :index
    end

    if params[:search] && params[:search][:q].present? && params[:search].count == 1
      @search = perform_search_on(searchable_models)
    end

    if params[:search] && params[:search][:q].present? && !models_from_params.empty?
      @search = perform_search_on(models_from_params)
    end
  end

  private

    def searchable_models
      # ActiveRecord::Base.connection.tables.map{|x| x.classify.safe_constantize}.compact.select(&:searchable?)
      convert_to_models(ActiveRecord::Base.connection.tables)
    end

    def models_from_params
      # params[:search].to_a.map{|x| x.first.classify.safe_constantize}.compact.select(&:searchable?)
      convert_to_models(params[:search].keys)
    end

    def convert_to_models(args)
      args.map{|x| x.classify.safe_constantize}.compact.select(&:searchable?)
    end

    def perform_search_on(models)
      search = []
      models.each do |model|
        query = model.search { fulltext params[:search][:q] }
        search << query if query.results.any?
      end
      search
    end
end

