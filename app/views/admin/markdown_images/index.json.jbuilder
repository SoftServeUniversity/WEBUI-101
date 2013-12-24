json.array!(@markdown_images) do |markdown_image|
  json.extract! markdown_image, :image
  json.url markdown_image_url(markdown_image, format: :json)
end
