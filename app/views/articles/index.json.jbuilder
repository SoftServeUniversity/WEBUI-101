json.array!(@articles) do |article|
  json.extract! article, :title, :content, :add_to_menu
  json.url article_url(article, format: :json)
end
