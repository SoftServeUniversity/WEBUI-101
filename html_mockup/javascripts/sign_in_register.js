$(function(){
	var $form_wrapper   = $('#form_wrapper'),
	$currentForm    = $form_wrapper.children('form.active'),
	$linkform       = $form_wrapper.find('.linkform');

	$form_wrapper.children('form').each(function(i){
	    var $theForm    = $(this);
	    if(!$theForm.hasClass('active'))
	        $theForm.hide();
	    $theForm.data({
	        width   : $theForm.width(),
	        height  : $theForm.height()
	    });
	});

	setWrapperWidth();

	$linkform.bind('click',function(e){
	    var $link   = $(this);
	    var target  = $link.attr('rel');
	    $currentForm.fadeOut(250,function(){
	        $currentForm.removeClass('active');
	        $currentForm= $form_wrapper.children('form.'+target);
	        $form_wrapper.stop()
	                     .animate({
	                        width   : $currentForm.data('width') + 'px',
	                        height  : $currentForm.data('height') + 'px'
	                     },350,function(){
	                        $currentForm.addClass('active');
	                        $currentForm.fadeIn(250);
	                     });
	    });
	    e.preventDefault();
	});

	function setWrapperWidth(){
	    $form_wrapper.css({
	        width   : $currentForm.data('width') + 'px',
	        height  : $currentForm.data('height') + 'px'
	    });
	}

	$form_wrapper.find('input[type="submit"]')
	             .click(function(e){
	                e.preventDefault();
	             });
})
