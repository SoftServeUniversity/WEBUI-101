json.array!(@biographies) do |biography|
  json.extract! biography, :name, :description
  json.url biography_url(biography, format: :json)
end
