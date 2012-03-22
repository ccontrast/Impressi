(function($) {
    $.fn.getAttributes = function() {
        var attributes = {}; 

        if(!this.length)
            return this;

        $.each(this[0].attributes, function(index, attr) {
            attributes[attr.name] = attr.value;
        }); 
				delete attributes['style']; 
        return attributes;
    }
})(jQuery);


// For the purpose of serializing deck_data before sending it over the wire

var pickle = function () {
	// each div under <div id ="impress">
	//   put the content into an array

	var userInput = {};
	var numberOfSteps = $('#impress .step').length;
	
	for(var i = 0; i < numberOfSteps; i++) {
			var currentStep = $('#impress .step')[i],
					stepAttributes = $(currentStep).getAttributes();
					
					for(var attr in stepAttributes) {
						
						userInput.attr = stepAttributes[attr];
						// console.log(attr + ":   " + stepAttributes[attr]);
						// 					console.log("---------------");
					}
				// console.log($('#impress .step')[i].textContent);
	    userInput.content = $('#impress .step')[i].textContent;
	
	}
	console.log(userInput);
	return userInput;
};

var sendViaAjax = function () {
	
	var deck_id = $('#impress').attr('deck_id');
  var contents = pickle();
		  
	$.ajax({
		 type: "PUT",
		 data:  {
	         content: contents
	     },
		 url:  "http://localhost:3000/decks/" + deck_id,
		 success: function() {
			console.log(contents);
		 },
		 failure: function() {
			 console.log("Fail."); 
		 }
	});
};

//setInterval(sendViaAjax, 16000);

$('#impress-button').click(sendViaAjax);

