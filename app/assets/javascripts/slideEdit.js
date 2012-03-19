var current_slide = null;
var mode = 'prezi';

document.addEventListener("keydown", function ( event ) {
	if (mode == "edit"){
		event.stopImmediatePropagation();
	}
});

document.addEventListener("keyup", function ( event ) {
	if (mode == "edit"){
		event.stopImmediatePropagation();
	}
});
  

$(function() {
	$("textarea#my_input").blur(function() {
		console.log('hello on blur textarea');
			if(!$(this).text()) {
				console.log('am i being called?');
				$(this).text("Edit the text here.");
				console.log($('div.active > .editable').get(0));
				$('div.active > .editable').text("Edit the text here.");
		}
		mode = 'prezi';
		$(this).hide();
		
		return false;
	});
	
	$(".editable").click(function() {
		var input = $("#my_input");
		mode = 'edit';
		current_slide = $(this);
		input.val($(this).text());
		input.fadeIn();
		input.focus();
		input.select();
		return false;
	});
	
	$("textarea#my_input").keyup(function() {
		current_slide.text($(this).text());
	});
	
	$("textarea").keyup(function(e) {
		if (e.keyCode == 13 || e.keyCode == 27) {
			$(this).blur();
			$(this).hide();
		}
	});
	
	
});