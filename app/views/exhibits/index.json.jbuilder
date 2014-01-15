json.timeline do
    json.type "default"
    json.date @exhibits do |exhibit|
        json.id "#{exhibit.id}"
        json.startDate "#{exhibit.chronology.year}"
        json.headline "#{exhibit.name}"
        json.text "#{exhibit.description.slice(0,400)}... #{link_to 'Read more', exhibit_path(exhibit)}"
    end
end
