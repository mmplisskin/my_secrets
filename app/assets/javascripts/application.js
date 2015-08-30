//= require jquery2
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-tagsinput
//= require jquery.readyselector.js
//= require location
//= require map.js
//= require velocity.min.js


$(document).ready(function(){


  $(".button-collapse").sideNav();

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

  //  var newwindow;
  //  function login(provider_url, width, height) {
  //    var screenX     = typeof window.screenX != 'undefined' ? window.screenX : window.screenLeft,
  //        screenY     = typeof window.screenY != 'undefined' ? window.screenY : window.screenTop,
  //        outerWidth  = typeof window.outerWidth != 'undefined' ? window.outerWidth : document.body.clientWidth,
  //        outerHeight = typeof window.outerHeight != 'undefined' ? window.outerHeight : (document.body.clientHeight - 22),
  //        left        = parseInt(screenX + ((outerWidth - width) / 2), 10),
  //        top         = parseInt(screenY + ((outerHeight - height) / 2.5), 10),
  //        features    = ('width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
   //
  //        newwindow = window.open(provider_url, 'Login', features);
   //
  //    if (window.focus)
  //      newwindow.focus();
   //
  //    return false;
  //  }





});
