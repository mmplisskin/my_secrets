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

//= require jquery2
//= require jquery_ujs
//= require bootstrap-tagsinput
//= require jquery.readyselector.js
//= require location
//= require map.js
//= require sessions.js


// $( document ).ready(function() {
//     $('.button-collapse').sideNav();
// });

$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal();
});






// console.log("//= require jquery.turbolinks  //= require_tree . // = require semantic-ui // = require bootstrap-sprockets")
