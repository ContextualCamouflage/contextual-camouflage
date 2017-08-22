App.map = App.cable.subscriptions.create("MapChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
      alert(data.id + data.latitude + data.longitude + data.illness_id);
  }
});
