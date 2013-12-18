json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :name, :registration_number, :date_of_receipt, :fund_creator, :opportunity_for_transportation, :the_degree_of_preservation, :authenticity, :the_electronic_version, :size, :description
  json.url admin_exhibit_url(exhibit, format: :json)
end
