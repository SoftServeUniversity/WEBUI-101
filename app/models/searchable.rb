module Searchable
  MODELS = [Exhibit, Exhibition, Article]
  mattr_accessor :count_results


  def self.find(q)
    self.count_results = 0
    search = []
    MODELS.each do |model|
      query = model.search { fulltext q; paginate page: 1, per_page: model.count }
      search << query.results if query.results.any?
      self.count_results += query.results.count
    end
    search.flatten.shuffle
  end
end
