json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :name
  json.links exhibit.pictures, :image
  json.url admin_exhibit_url(exhibit, format: :json)
end
