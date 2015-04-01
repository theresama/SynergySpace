// adminjs.js

$(function () {

	// function changeAdmin() {
	// 	//alert(id)
	// 	console.log(arguments[0]);
	// }

	function asdf (a) {
		console.log(a)
	}
	
	rows = $("#userTable tr")
	for(var i=0; i<rows.length; i++){
		//console.log("i", i);
	    var row = rows[i];
	    var id = row.id;
	    console.log(id)
		var selector = $(row).find("#adminSelect" + id);
		//console.log(selector);
		// var current = selector.find(".admin1").text();
		// console.log(current);
		selector.change(function(event) {
			console.log(event);

			var isAdmin = "false"
			if (event.target[0].text == "False") {
				var isAdmin = "true"
			}
			event.target[0].text

			$.ajax({
			  type: "POST",
			  url: "/admin/makeAdmin",
			  async: false,
			  data: { id: event.target.id.slice(11), adminStatus: isAdmin },
			  success: function(data){
			  	console.log(data);
			  	//window.location = "/dashboard/users"
			  },
			  error: function(data){
			  	//document.write("what?");
			  },
			  dataType: "json"
			});

		});
	}

});