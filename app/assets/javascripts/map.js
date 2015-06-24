
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

function initialize() {

  var url = window.location.origin + window.location.pathname + ".json";

  $.get(url, function(results){
    // console.log(results)
    if (results[0] == undefined ){
      return

    }
    else{

      var post = results[0]["ouser"]
      // console.log(post)


      var lat = post["latitude"];
      var long = post["longitude"];
      console.log(lat,long)

      var myCenter = new google.maps.LatLng(lat,long);

      var mapProp = {
        center: myCenter,
        zoom:12,
        zoomControl:false,
        panControl:false,
        mapTypeId:google.maps.MapTypeId.HYBRID
      };
      var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

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
google.maps.event.addDomListener(window, 'load', initialize);
