class Api::V1::UsersController < ApplicationController
  before_action :found_user, only: [:show, :update]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  private

  def found_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :league_account)
  end

end
