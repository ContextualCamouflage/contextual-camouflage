function geolocateUser() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function (position) {
      $('#latitude').val(position.coords.latitude);
      $('#longitude').val(position.coords.longitude);
    });
  } else {
    alert("Sorry! Geolocation services are unavailable in this browser. Please use an up to date browser or you will be unable to interact with this installation.");
  }
}

function informUser() {
  var isConfirmed = confirm("In order to interact with Contextual Camouflage, please allow this app to locate your coordinates. Please note we do not store any sensitive data unless you choose to provide it otherwise.");
  if(isConfirmed) {
    geolocateUser();
  } else {
    alert("Sorry! You may view the site but form submission will be disabled.");
  }
}

$(document).on('turbolinks:load', function() {
  informUser();
});