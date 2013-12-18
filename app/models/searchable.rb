module Searchable
  MODELS = [Exhibit, Exhibition, Article]

  def self.find(q, page)
    Sunspot.search MODELS do
      fulltext q
      order_by(:score, :desc)
      paginate page: page, per_page: 10
    end
  end
end
