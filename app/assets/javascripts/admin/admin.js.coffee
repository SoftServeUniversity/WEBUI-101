//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
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
    txt2=""
    editor1.hooks.set "insertImageDialog", (callback) ->
      $('#myModal').modal('show')
      $(document).on 'click', 'img', ->
        select_image_url=$(this).attr("src")
        insert_image="<img src='"+select_image_url+"'>"
        $('.select_image').html(insert_image)
      $('button.btn.btn-default').click ->
        $('#myModal').modal('hide')
      $('button.btn.btn-primary').click ->
        url=$('.select_image > img').attr("src")
        radio_check_val=$("input[name=size]:checked").val()
        if radio_check_val=="full"
          url_full=url.replace("thumb_","")
          callback(url_full)
        else
          callback(url)
        $('#myModal').modal('hide')
      true
    editor1.run()

$ ->
  $("input[type=checkbox]").click ->
    $(this).parents(".simple_form.edit_user").submit()
