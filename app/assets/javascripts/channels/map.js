App.map = App.cable.subscriptions.create("MapChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    //   console.log(data.id + data.latitude + data.longitude + data.illness_name);
      var markerLat = data.latitude;
      var markerLong = data.longitude;
      var markerName = data.illness_name;
      appendMarker(markerLat, markerLong, markerName);
  }
});

function appendMarker(markerLat, markerLong, markerName) {
  var dynamicIcon = '';
  var mapMarker = '';
  dynamicIcon = new L.Icon({
    iconUrl:'/assets/'+markerName
  });
  mapMarker = new L.marker([markerLat, markerLong], {
    icon:dynamicIcon });
  map.addLayer(mapMarker);
}

