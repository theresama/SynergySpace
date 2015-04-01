// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){

	$("#searchForm").on('submit', function(e){
		e.preventDefault();
		var query = $("#query").val();
		if (query != ""){
			window.location.replace("/spaces/tagged/" + query);
		}		
	});

	$('.approveLease')
		.on('ajax:send', function () { $(this).addClass('loading'); })
		.on('ajax:complete', function () { $(this).removeClass('loading'); })
		.on('ajax:error', function () { 
			console.log("ya dun goofed");
		})
		.on('ajax:success', function(e, data, status, xhr) { 
			console.log(data.lease_status);
			$(this).parent(".leaseStatus").html("true");
	});
})


