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
    # 在被选中的元素结尾插入内容
    # $('#messages').append data['message']
    # 在被选中的元素开头插入内容
    $('#messages').prepend data['message']
    # created_time = moment(data.created_at).startOf('second').fromNow()
    # @speak(data, created_time)

  speak: (message)->
    @perform 'speak', message:message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
