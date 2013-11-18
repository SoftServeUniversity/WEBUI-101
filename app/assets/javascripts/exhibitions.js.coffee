# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('[data-behaviour~=datepicker]').datepicker({})

  $('#exhibition_exhibit_ids').removeClass('form-control')
  $('#exhibition_exhibit_ids').select2
    width: '300'
    placeholder: 'Choose exhibit'
    allowClear: true
