function initialize() {
  console.log("init")
    var x = document.getElementById("location")

  function getLocation() {


      if (navigator.geolocation) {

          navigator.geolocation.getCurrentPosition(showPosition);
              // console.log(navigator.geolocation.getCurrentPosition)
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }

  function showPosition(position) {
      var latlon = position.coords.latitude + "," + position.coords.longitude;
      // console.log(latlon)

      document.getElementById("location").innerHTML = latlon

        ajax(position.coords.latitude, position.coords.longitude)
  }




  function ajax(lat,long){
          console.log("yes");
    $.ajax({


    type: "POST",
    url: "/posts",
    data: { post: { title: lat , description: long } },
  })

}

  getLocation()

}



function get(){

    $( '#okbtn' ).click(function() {
      initialize
    });
}


$(document).on("ready page:load", get);

// $(document).on("ready page:load", initialize);
