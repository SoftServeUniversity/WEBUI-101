# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#exhibit_tags_string').select2
    tags: if gon? then gon.tags else []
    maximumInputLength: 10
    tokenSeparators: [","]
    width: '200'
  $('textarea.wmd-input').each (i, input) ->
    attr = $(input).attr('id').split('wmd-input')[1]
    converter = new Markdown.Converter()
    Markdown.Extra.init(converter)
    editor = new Markdown.Editor(converter, attr)
    editor.run()
