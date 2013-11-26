//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require pagedown_bootstrap
//= require bootstrap-datepicker
//= require markdown.converter
//= require markdown.editor
//= require markdown.sanitizer
//= require markdown.extra
//= require select2
//= require jquery_nested_form
//= require_tree .

$ ->
  $.get "/admin/tags.json", (response) ->
    get_tags(item.name for item in response)

  get_tags=(data) ->
    $('#exhibit_tags_string').select2
      tags: data
      maximumInputLength: 10
      tokenSeparators: [","]

  if $("#wmd-input").length > 0
    converter1 = Markdown.getSanitizingConverter();
    editor1 = new Markdown.Editor(converter1);
    editor1.run()


