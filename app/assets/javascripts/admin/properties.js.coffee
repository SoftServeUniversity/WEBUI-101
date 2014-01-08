$.get "/admin/tags.json", (response) ->
    get_tags(item.name for item in response)

  get_tags=(data) ->
    $('.special').select2
      tags: data
      maximumInputLength: 10
      tokenSeparators: [","]
