var baseUrl = "http://localhost:3000/";
// var addressArray = ["142 W Hastings St, Vancouver, BC V6B 1G8", "Ottawa Ont"];
// var addressArray = ["142 W Hastings St, Vancouver, BC V6B 1G8", "Ottawa Ont"];
var addressArray = [];


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: 49.246292, lng: -123.116226}
  });
  var geocoder = new google.maps.Geocoder();

  // geocodeAddress(geocoder, map);
  document.getElementById('submit').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
  });

}

function geocodeAddress(geocoder, resultsMap) {
  // var address = document.getElementById('address').value;
  // console.log( document.getElementById('address').value);
  console.log(addressArray);
  for(var i=0, len=addressArray.length; i < len; i++){
    var address = addressArray[i];
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        // resultsMap.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
}


$(document).ready(function(){
  $.ajax({
    method: "GET",
    url: baseUrl + "public_organizations.json",
    success: function(organizations){
      for(var i = 0, len = organizations.length; i < len; i++) {
        // console.log(organizations[i].address);
        addressArray.push(organizations[i].address);
      }
      console.log(addressArray);
    },
    error:  function(){
      console.log("Error loading addresses. Please try again");
    }
  });


});
