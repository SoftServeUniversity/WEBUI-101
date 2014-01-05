//= require jquery
//= require jquery_ujs
//= require timelineJS/embed
//= require select2
//= require_tree .

$ ->
  $("#carousel span").append "<img src=\"/uploads/img/gui/carousel_glare.png\" class=\"glare\" />"
  $("#thumbs a").append "<img src=\"/uploads/img/gui/carousel_glare_small.png\" class=\"glare\" />"
  $("#carousel").carouFredSel
    responsive: true
    circular: false
    auto: false
    items:
      visible: 1
      width: 200
      height: "56%"

    scroll:
      fx: "directscroll"

  $("#thumbs").carouFredSel
    responsive: true
    circular: false
    infinite: false
    auto: false
    prev: "#prev"
    next: "#next"
    items:
      visible:
        min: 2
        max: 6

      width: 150
      height: "66%"

  $("#thumbs a").click ->
    $("#carousel").trigger "slideTo", "#" + @href.split("#").pop()
    $("#thumbs a").removeClass "selected"
    $(this).addClass "selected"
    false
