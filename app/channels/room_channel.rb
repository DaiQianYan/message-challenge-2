class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    Message.create! content: data['message']
    # Message.create!(content: data['message'], user_id: data['sender_id'], channel_id: data['room_id'])
    # Message.create!(content: data['message'], user_id: data['sender_id'])
    
  end

  def speak_to_db(data)
    # Message.create!(content: data['message'], user_id: data['sender_id'], channel_id: data['room_id'])
    Message.create!(content: data['message'], user_id: data['sender_id'])
  end 
  
end

