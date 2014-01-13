# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $.get "/admin/tags.json", (response) ->
    get_tags(item.name for item in response)

  get_tags=(data) ->
    $('#exhibit_tags_string').select2
      tags: data
      maximumInputLength: 10
      tokenSeparators: [","] 

  $.get "/admin/biographies.json", (response) ->
    get_biographies(item.name for item in response)

   get_biographies=(data) ->
    $('#exhibit_biographies_string').select2
      tags: data
      maximumInputLength: 30
      tokenSeparators: [","]      

  converter1 = Markdown.getSanitizingConverter();
  editor1 = new Markdown.Editor(converter1);
  editor1.run()
