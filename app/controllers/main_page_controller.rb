class MainPageController < ApplicationController
  def index
    @collection = get_items(Exhibition, Exhibit, Article)
  end
  private

    def get_items(*models)
      collection = []
      models.each {|model| collection += model.last(3)}
      collection.sort {|x, y| y.created_at <=> x.created_at}
    end
end
