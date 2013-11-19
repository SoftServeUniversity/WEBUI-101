json.array!(@tags) do |tag|
  json.extract! tag, :name
  json.url tag_url(tag, format: :json)
end
