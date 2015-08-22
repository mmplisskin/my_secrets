//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-tagsinput
//= require jquery.readyselector.js
//= require location
//= require map.js
//= require velocity.min.js


$(document).ready(function(){




  $("#tags").tagsinput('items')

  $('.modal-trigger').leanModal();


  $('.collapsible').collapsible({
    accordion : false
  });


  var acc = $('.collapsible-header')
  acc.on("click", function(e) {
        //scroll to the div ON CLICK
        $(this)
            .velocity("scroll", {

                        duration: 900,
                        delay: 300,
                        offset: -56,
                      });


   });





});
