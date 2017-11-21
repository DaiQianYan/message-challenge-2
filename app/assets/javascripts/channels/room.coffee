App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected!')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected!')

  received: (data) ->
    # r_id = data['room_id']
    # message_id = '#message-controller-' + r_id
    # $(message_id).append data['message']

    # #   add message to left-side header
    # room_body_id = '#room-body-' + r_id
    # $(room_body_id).empty();
    # $(room_body_id).append data['message_prompt']

    # #   if someone seed messages to room should be signed 'unreader'
    # c_u_id = ""   + getCookie('need_id')
    # s_u_id = ""   + data['sender_id']
    # room_read_id = '#room-read-' + r_id
    # if c_u_id isnt s_u_id
    #   $(room_read_id).removeClass('no-display')
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

  # speak_to_db: (message, room_id, sender_id) ->
  #   @perform('speak_to_db', message: message, room_id: room_id, sender_id: sender_id)

  speak_to_db: (message, sender_id) ->
    @perform('speak_to_db', message: message, sender_id: sender_id)


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    # App.room.speak_to_db(content, room_id, sender_id)
    # sender_id = getCookie('need_id')
    # App.room.speak_to_db(content, sender_id)
    event.target.value = ''
    event.preventDefault()
