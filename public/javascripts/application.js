$(document).ready( function(){
  //$('.rounded').corners();
  $('input:submit').addClass('ui-corner-all');
  //$('input:submit').corners();
  $('a.button').css('color','white');
  //$('a.button').corners();
  $('#navigation').addClass('ui-corner-all');
  $('#footer').addClass('ui-corner-all');
	
	$('.main').addClass("ui-widget post-content-widget");
	$('.main > h3').addClass("ui-widget-header  ui-corner-top");
	$('.main > .clearfix').addClass("ui-widget-content ui-corner-bottom post-content-widget-details");

	$('.dialog_link').click(function() {
		$.getScript($(this).attr('href'));
		return false;
	});


});
