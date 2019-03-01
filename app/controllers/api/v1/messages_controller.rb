class Api::V1::MessagesController < ApplicationController

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    # byebug
    @message = Message.create(message_params)
    ChatroomChannel.broadcast_to(@message.chatroom, { message: @message })
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:message_content, :user_id, :chatroom_id)
  end

end
