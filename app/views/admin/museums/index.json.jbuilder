json.array!(@museums) do |museum|
  json.extract! museum, :name, :address, :latitude, :longitude
  json.url museum_url(museum, format: :json)
end
