//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-tagsinput
//= require jquery.readyselector.js
//= require location
//= require map.js


$(document).ready(function(){

  $("#tags").tagsinput('items')

  $('.modal-trigger').leanModal();


  $('.collapsible').collapsible({
    accordion : false
  });


});
