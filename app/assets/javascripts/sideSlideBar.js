	var impressSlider;
	
	//generate anchor nodes to jump easily between slides
	var populateSlideViewer = function(id,step) {
		var a = $('<a href="#step-' + (id + 1) + '" id="anchor-step-' + (id+1) + '" class="viewer-anchor" />');
				li = $('<li class="step-view" style="width:300px;" />');
				
		a.html(li);
		li.html(step);
		
		return a;
	};
	
	var createStepClone = function(step) {
		var cloned    = $(step).clone(),
		 	  width     = ($(step).css('width').match(/[0-9]+/)) / 5,
			  height    = ($(step).css('height').match(/[0-9]+/)) / 5,
			  fontSize  = ($(step).css('font-size').match(/[0-9]+/)) / 5;

		cloned.css({
			'width':             width+"px",
			'height':            height+"px",
			'font-size':         fontSize+"px",
			'background-color':  'white',
			'border-radius':     '10px'
		});
		cloned.attr('id', '').addClass('custom-step').removeClass('step');
		
		return cloned;
	};
	
	var getActiveThumb = function() {
		var oldLocation = location.href;
		setInterval(function() {
			if(location.href != oldLocation) {
		  	var idFromLocation = location.href.split('/').pop(),
						slideIndex     = idFromLocation.split('-').pop();
						
				if($('a > li > div').hasClass('custom-active')) {
					$('a > li > div').removeClass('custom-active');
					impressSlider.goToSlide(parseInt(slideIndex-1));
				}
				
				$('a#anchor-'+idFromLocation + ' > li > div').addClass('custom-active');
		    oldLocation = location.href
		    }
		 }, 100);
	};

	window.onload = function() {
		getActiveThumb();
		
		// find number of slides and dynamically add div thumbnails to the page
		var numSlidesInDeck =  $('div.step').length;
	
		for(var i = 0; i < numSlidesInDeck;i++ ) {
			var step         = $("div#step-"+(i+1)).get(0),
					clonedStep   = createStepClone(step);

			$('#slide-list').append(populateSlideViewer(i, clonedStep));
		}

		impressSlider = $('div ul#slide-list').bxSlider({
			mode :            'vertical',
			displaySlideQty : 4,
			moveSlideQty :    4,
			speed :           100,
			infiniteLoop :    true,
			controls :        false
		});
		impress();
		//impressSlider.reloadShow();
	};