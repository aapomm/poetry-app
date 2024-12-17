App.cable.subscriptions.create('GamesChannel', {
  connected(){
    console.log('Subscribed to GamesChannel!');
  },

  rejected(){
  },

  received(payload) {
    console.log(payload)
  }
})
