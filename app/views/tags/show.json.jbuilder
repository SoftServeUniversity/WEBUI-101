json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :name
  json.links exhibit.pictures, :image
  json.url admin_exhibit_url(exhibit, format: :json)
end
json.timeline do
    json.date @exhibits do |exhibit|
        json.start_date exhibit.created_at
        json.headline exhibit.name
        json.text "Demo"
        json.asset do
            json.media "http://youtu.be/f-x8t0JOnVw"
            json.credit ""
            json.caption ""
        end
    end
end

