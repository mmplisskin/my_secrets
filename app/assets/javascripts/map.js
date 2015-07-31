
// google.maps.event.addDomListener(window, 'load', initialize);
// google.maps.event.addDomListener(window, 'page:load', initialize);


$('.posts.index').ready(function () {

  function checkAJAX(){
    if ($( '.maptrigger' ).hasClass('mapget')){
      console.log("success class")
        initializeMAP();

    }
    else{
      setTimeout(checkAJAX, 500)
    }
  }

  checkAJAX();

  function initializeMAP() {
    console.log("updated")
    var url = window.location.origin + window.location.pathname + ".json";

    $.get(url, function(results){
      // console.log(results)
      if (results[0] == undefined ){
      }

      else{

        var lat = results[0]["ouser"]["latitude"];
        var long = results[0]["ouser"]["longitude"];
        // console.log(post)

        console.log(lat,long)

        var myCenter = new google.maps.LatLng(lat,long);

        var mapProp = {
          center: myCenter,
          zoom:12,
          zoomControl:false,
          panControl:false,
          zoomControl: false,
          scaleControl: false,
          streetViewControl: false,
          overviewMapControl: false,
          MapTypeControl:false,
          disableDefaultUI: true,
          mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        google.maps.event.addDomListener(window, "resize", function() {
          var center = map.getCenter();
          google.maps.event.trigger(map, "resize");
          map.setCenter(center);
         });

          google.maps.event.addListener(map, 'bounds_changed', function() {
              var bounds = map.getBounds();
          })

        var marker = new google.maps.Marker({
          position:myCenter
        });
        marker.setMap(map);
        google.maps.event.addListener(marker,'click', function() {
          map.setZoom(16);
          map.setCenter(marker.getPosition());
        });


    }
  }
  );}

  google.maps.event.addDomListener(window, 'load', initializeMAP);


});
