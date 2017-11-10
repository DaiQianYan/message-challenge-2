App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected!')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected!')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert data['message']
    created_time = moment(data.created_at).startOf('second').fromNow()
    @speak(data, created_time)

  speak: (message, )->
    @perform 'speak', message:message

