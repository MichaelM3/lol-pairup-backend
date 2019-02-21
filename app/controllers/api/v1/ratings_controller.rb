class Api::V1::RatingsController < ApplicationController
  before_action :found_rating, only: [:show, :update, :destroy]

  def show
    render json: @rating
  end

  def create
    @rating = Rating.create(rating_params)
    render json: @rating, message: "Created User!"
  end

  def update
  end

  def destroy
  end

  private

  def found_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:rater_id, :rated_id, :rating)
  end

end
