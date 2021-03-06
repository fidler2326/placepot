// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require_tree .

$(document).on("ready page:load", function(){

  // Close alert
  $('.js-alert-close').click(function(){
    $('.alert').removeClass('active');
    $('.alert').addClass('close');
    return false;
  });

  // Tabs
  $('.switch a').click(function(){
  	// Remove classes from perviously active tabs
  	$('.tab').removeClass('active');
  	$('.switch a').removeClass('selected');
  	// Get active tab id
  	var active = $(this).attr('href');
  	// Display active tab
  	$('div' + active).addClass('active');
  	// Set current tab link to active
  	$(this).addClass('selected');
  	return false;
  });

  // Mobile menu trigger
  // -------------------
  $('.menu-trigger').click(function() {
    $(this).toggleClass('active');
    $('header ul').toggleClass('active');
  });

});
