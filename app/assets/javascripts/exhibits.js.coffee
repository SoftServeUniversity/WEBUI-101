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
      width: '200'
  $('textarea.wmd-input').each (i, input) ->
    attr = $(input).attr('id').split('wmd-input')[1]
    converter = new Markdown.Converter()
    Markdown.Extra.init(converter)
    editor = new Markdown.Editor(converter, attr)
    editor.run()
