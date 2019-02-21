class Api::V1::FriendshipsController < ApplicationController
  before_action :found_friendship, only: [:show, :destroy]

  def show
    render json: @friendship
  end

  def create
    @friendship = Friendship.create(friendship_params)
    render json: @friendship
  end

  def destroy
    @user = User.find(@friendship.user_id)
    @friendship.destroy
    render json: @user
  end

  private

  def found_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
