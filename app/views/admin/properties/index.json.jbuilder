json.array!(@properties) do |property|
  json.extract! property, :title, :value
  json.url property_url(property, format: :json)
end
