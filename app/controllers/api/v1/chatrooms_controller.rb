class Api::V1::ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
    render json: @chatrooms, status: :ok
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    render json: @chatroom
  end

end
