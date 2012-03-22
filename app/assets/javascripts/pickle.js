(function($) {
    $.fn.getAttributes = function() {
        var attributes = {}; 

        if(!this.length)
            return this;

        $.each(this[0].attributes, function(index, attr) {
            attributes[attr.name] = attr.value;
        });
		attributes['content'] = $.trim(this.text());
		delete attributes['style']; 
        return attributes;
    }
})(jQuery);


// For the purpose of serializing deck_data before sending it over the wire

var grabDeckData = function () {
	// each div under <div id ="impress">
	//   put the content into an array

	var userInput = {};
	var numberOfSteps = $('#impress .step').length;
	

	for(var i = 0; i < number_of_steps; i++) {
		var step_tag = $('#impress .step')[i];
	    user_input.push($(step_tag).getAttributes());
	}
	
	console.log(userInput);
	return userInput;
};

var sendViaAjax = function () {
	
	var deck_id = $('#impress').attr('deck_id');
    var contents = grabDeckData();
		  
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


setInterval(sendViaAjax, 10000);

$('#impress-button').click(sendViaAjax);

