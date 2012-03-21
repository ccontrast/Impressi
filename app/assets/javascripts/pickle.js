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

	var user_input = [];
	var number_of_steps = $('#impress .step').length;
	
	for(var i = 0; i < number_of_steps; i++) {
			var test = $('#impress .step')[i]
		console.log($(test).getAttributes());
	    user_input.push($('#impress .step')[i].textContent);
	}
	
	return user_input;
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

setInterval(sendViaAjax, 80000);

$('#impress-button').click(sendViaAjax);

