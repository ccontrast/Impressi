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
	var activeInput = false,
			textarea = document.createElement('textarea'),
			inlineEditor = $(textarea);
	inlineEditor.attr('rows', '3');
	inlineEditor.attr('id', 'inline-editor');
	inlineEditor.attr('placeholder', 'put your awesome presentation awesomeness here!')
	
	$(".editable").click(function(e) {

		if(!$(this).hasClass('active') || $(this).attr('id', 'overview')) {
			return false;
		}
		
		current_slide = $(this);
		currentText = current_slide.text().length == 0 ? "write stuff" : current_slide.text();
		inlineEditor.val(currentText);
		e.stopImmediatePropagation();

		if(activeInput == false) {
			activeInput = true;
			mode = 'edit';
			console.log(mode);
			$(this).html(inlineEditor);
			inlineEditor.focus();
		} else {
		 		activeInput = false;
				mode = 'prezi';
				inlineEditor.blur();
				e.stopImmediatePropagation();
		}

		inlineEditor.on({	
			keyup: function(e) {
				if (e.keyCode == 27) {
					$(this).blur();
					activeInput = false;
				}
			},
			
			click: function(e) {
				e.stopPropagation();
			},
					
			blur: function(e) {
				currentInput = $(this).val();
				if($(this).val() === "" || $(this).val().length === 1) {
					current_slide.text($(this).attr('placeholder'));
					e.stopPropagation();
				} else {
					current_slide.text(currentInput);
					e.stopImmediatePropagation();
					$(this).val("");
				}
				mode = 'prezi';
			}
		});
		return false;
	});
	
});