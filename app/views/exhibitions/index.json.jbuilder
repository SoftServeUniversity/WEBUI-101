json.array!(@exhibitions) do |exhibition|
  json.extract! exhibition, :name, :description, :start_date, :end_date, :adress, :latitude, :longitude, :virtual
  json.url exhibition_url(exhibition, format: :json)
end
