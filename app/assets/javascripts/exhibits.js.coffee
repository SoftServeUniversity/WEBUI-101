# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  converter1 = Markdown.getSanitizingConverter();
  editor1 = new Markdown.Editor(converter1);
  editor1.run()
