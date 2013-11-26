json.array!(@tags) do |tag|
  json.extract! tag, :name
  json.url admin_tag_url(tag, format: :json)
end
