function initialize() {
  console.log("init")

    var x = document.getElementById("location")

  function getLocation() {
      console.log("location running")

      if (navigator.geolocation) {
            console.log("in if nav")
          navigator.geolocation.getCurrentPosition(showPosition);
              // console.log(navigator.geolocation.getCurrentPosition)
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }

  function showPosition(position) {
      var latlon = position.coords.latitude + "," + position.coords.longitude;
      console.log(latlon)

      document.getElementById("location").innerHTML = latlon
      var id = $('#hidden')[0].innerHTML
      console.log(id)
        ajax(position.coords.latitude, position.coords.longitude, id);
  }




  function ajax(lat,long,id){
          console.log("yes ajax");
          // console.log("/ousers/"+id)
          console.log(lat,long,id)

    $.ajax({

    type: "PUT",
    url: "ousers/"+id,
    data: { ouser: { latitude: lat, longitude: long}},
    dataType: 'json',
  })

}

  getLocation()

}

$(document).on("ready page:load", function(){
      $( '#okbtn' ).click(function() {
        console.log('get running')
        $( '#okbtn.i' ).addClass("fa-spin")
        initialize();

      });
  })
