import consumer from "channels/consumer"

consumer.subscriptions.create("BroadcastMessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageContainer = document.getElementById("live-message");
    if(messageContainer) {
      messageContainer.innerHTML = data.content;
    }
  }
});
