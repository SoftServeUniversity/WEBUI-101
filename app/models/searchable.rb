module Searchable
  MODELS = [Exhibit, Exhibition, Article]

  def self.find(q)
    search = []
    MODELS.each do |model|
      query = model.search { fulltext q }
      search << query.results if query.results.any?
    end
    search.flatten!.shuffle! unless search.empty?
  end
end
