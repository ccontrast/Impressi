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
	$(".editable").click(function() {
		var input = $("#my_input").on({
			keyup: function() {
				current_slide.text($(this).val());
			},
			
			blur: function() {
					if(!$(this).text()) {

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
		input.val($(this).text());
		input.fadeIn();
		input.focus();
		input.select();
		return false;
	});
	
	// $("textarea#my_input").keyup(function() {
	// 	current_slide.text($(this).val());
	// });
	
	$("textarea").keyup(function(e) {
		if (e.keyCode == 13 || e.keyCode == 27) {
			$(this).blur();
			$(this).hide();
		}
	});
});