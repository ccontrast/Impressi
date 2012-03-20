var current_slide = null,
 		mode = 'prezi';

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
	var activeInput = false;
	
	$.click(function(e) {
		e.stopImmediatePropagation();
		
		console.log("my id:" + $(this).attr('id'))
		var input = $("#my_input");
				input.val($(this).val());
		
		if(!$(this).hasClass('active')) {
			return false;
		}
		
		
		
		mode = 'edit';
		current_slide = $(this);
		if(activeInput == false) {
			input.fadeIn();
			input.text($(this).val());
			input.focus();
			input.select();
			activeInput = true;
		} else {
			input.blur();
			input.hide();
			activeInput = false;
		}

		
		input.on({
			keyup: function() {
				current_slide.text($(this).val());
				activeInput = false;
			},
			
			blur: function() {
				if( $(this).val() === "" || $(this).val().length === 1) {
					$(this).val("Edit the text here.");
					$('div.active > .editable').val("Edit the text here.");
				}
				mode = 'prezi';
				$(this).hide();
		
			}
		});

		return false;
	});

	$("textarea").keyup(function(e) {
		if (e.keyCode == 13 || e.keyCode == 27) {
			$(this).blur();
			$(this).hide('fast');
		}
	});
});