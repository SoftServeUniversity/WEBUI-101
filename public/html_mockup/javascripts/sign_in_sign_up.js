$(function(){

  var formWrapper = $('.form-wrapper'),
      linkForm    = formWrapper.find('.linkform'),
      menuLink    = $('a#sign-in'),
      loginForm   = formWrapper.children('form.form-login');
      closeForm   = $('.icon-remove'),
      content     = $('.content');

  menuLink.on('click', function() {
    loginForm.fadeIn(200).addClass('active');
    content.animate({
      'opacity': '0.3'
    },200);
    var currentForm = loginForm;

    linkForm.bind('click',function(e){
      var link   = $(this),
          target  = link.attr('rel');

      currentForm.fadeOut(250,function(){
        currentForm.removeClass('active');
        currentForm = formWrapper.children('form.'+target);
        currentForm.addClass('active').fadeIn(250);
      });
        e.preventDefault();
    });
  });

  closeForm.on('click', function() {
    $('form.active').fadeOut(200).removeClass('active');
    content.animate({
      'opacity': '1'
    },200);
  });


  formWrapper.find('input[type="submit"]').click(function(e){
                                                    e.preventDefault();
                                                 });
})
