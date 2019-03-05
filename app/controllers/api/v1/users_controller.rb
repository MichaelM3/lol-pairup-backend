class Api::V1::UsersController < ApplicationController
  require 'json'
  require 'rest-client'
  before_action :found_user, only: [:show, :update, :user_league_info]

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
    if @user.valid?
      token = encode_token(@user.id)
      render json: { user: @user, token: token }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update
    api_key = "RGAPI-a7e3c40c-7270-4b42-bddb-efd7d455a2cc"
    user_response_string = RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{params[:user][:league_account].delete(" ")}?api_key=#{api_key}")
    user_response_hash = JSON.parse(user_response_string)
    if user_response_hash["id"]
      rank_response_string = RestClient.get("https://na1.api.riotgames.com/lol/league/v4/positions/by-summoner/#{user_response_hash["id"]}?api_key=#{api_key}")
      rank_response_hash = JSON.parse(rank_response_string)
      @user.update(league_account: user_response_hash["name"], summoner_id: user_response_hash["id"], rank: rank_response_hash[0]["tier"], user_icon: "http://ddragon.leagueoflegends.com/cdn/9.4.1/img/profileicon/#{user_response_hash["profileIconId"]}.png")
      render json: @user
    end
  end

  private

  def found_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :league_account)
  end

end
