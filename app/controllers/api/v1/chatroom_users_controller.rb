class Api::V1::ChatroomUsersController < ApplicationController

  def index
    @chatroom_users = ChatroomUser.all
    render json: @chatroom_users
  end

  def show
    @chatroom_user = ChatroomUser.find(params[:id])
    render json: @chatroom_user
  end

  def create
    @chatroom_user = ChatroomUser.find_or_create_by(chatroom_user_params)
    if @chatroom_user.valid?
      render json: @chatroom_user
    else
      render json: { messages: @chatroom_user.errors.full_messages }
    end
  end

  private

  def chatroom_user_params
    params.require(:chatroom_user).permit(:user_id, :chatroom_id, :admin)
  end

end
