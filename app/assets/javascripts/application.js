//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-tagsinput
//= require jquery.readyselector.js
//= require location
//= require map.js


$(document).ready(function(){

  if (/iPad|iPhone|iPod/.test(navigator.platform)){
    alert("Please remember to have location services enabled to use my secrets on IOS")
  }



  $("#tags").tagsinput('items')

  $('.modal-trigger').leanModal();


  $('.collapsible').collapsible({
    accordion : false
  });


});
