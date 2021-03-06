// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$.material.init();
$(document).on('turbolinks:load',function(){
	$('#display_appointment_form').on('click',function(){
		$("#availability_form").fadeOut(function(){
			$("#appointment_form").fadeIn();
		});
		
		
	});
	$('#display_availability_form').on('click',function(){
		$("#appointment_form").fadeOut(function(){
			$("#availability_form").fadeIn();
		});
	});
	$('#add_worker_div').on('click','.add_worker_form',function(){
		$(this).fadeOut();
	});
	$('#added_worker_div').on('click','.remove_worker_form',function(){
		$(this).fadeOut();
	});

});

