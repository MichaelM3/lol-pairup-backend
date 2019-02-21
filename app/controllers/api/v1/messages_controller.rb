class Api::V1::MessagesController < ApplicationController

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:message_content, :user_id, :chatroom_id)
  end

end
