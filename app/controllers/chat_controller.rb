class ChatController < ApplicationController
  def index
    @messages = Message.order('created_at desc')
  end
end
