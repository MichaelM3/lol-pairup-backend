class ChampionUsersController < ApplicationController

  def index
    @champion_users = ChampionUser.all
    render json: @champion_users
  end

  def create
    @user = User.find(params["champion_user"]["user_id"])
    @champion_user = ChampionUser.create(user_id: params["champion_user"]["user_id"], champion_id: params["champion_user"]["champion_id"])
    if @user.count_champions > 3
      @user.champion_users.first.delete
    end
    render json: @champion_user
  end

end
