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
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require bootstrap-datepicker
//= require raphael-min.js
//= require justgage.1.0.1.js
//= require justgage.1.0.1.min.js



$(function() {  
  setTimeout(updateNotifications, 3000);
  $("#notification-icon").click(function(){
  	$("#notification-count").css("background-color","");
		$("#notification-count").html("");
  })
});

function updateNotifications () {
	previous_length = $("#support-menu").children().length
	
  $.ajax({url:"/update_notifications",success:function(){ 
  	current_length = $("#support-menu").children().length;  	
  	if (current_length > previous_length){
		$("#notification-count").css("background-color","red");
		$("#notification-count").html(current_length - previous_length);
	}
  }});   
  setTimeout(updateNotifications, 10000);
}
