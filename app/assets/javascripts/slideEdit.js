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
	var input = $("#my_input");
	
	$(".editable").click(function() {
		input.val($(this).val());
		if(!$(this).hasClass('active')) {
			return false;
		}
		
		input.on({
			keyup: function() {
				current_slide.text($(this).val());
			},
			
			blur: function() {
				if( $(this).val() === "" || $(this).val().length === 1) {
					$(this).val("Edit the text here.");
					$('div.active > .editable').val("Edit the text here.");
				}
				mode = 'prezi';
				$(this).hide();

				return false;
			}
		});
		
		mode = 'edit';
		current_slide = $(this);
		input.fadeIn();
		
		input.text($(this).val());
		input.focus();
		input.select();
		
		return false;
	});

	
	$("textarea").keyup(function(e) {
		if (e.keyCode == 13 || e.keyCode == 27) {
			$(this).blur();
			$(this).hide();
		}
	});
});