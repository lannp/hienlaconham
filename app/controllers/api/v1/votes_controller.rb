class Api::V1::VotesController < ApplicationController
  respond_to :json

  def index
    if(params[:user_id] && params[:post_id])
      votes = Vote.find_by_user_post(params[:user_id], params[:post_id])
    else
      votes = Vote.all
    end
    respond_with votes
  end

  def show
    respond_with Vote.find(params[:id])
  end

  def create
    vote = Vote.create(vote_params)
    if vote.save
      render json: vote, status: 201, location: [:api, vote]
    else
      render json: { errors: vote.errors }, status: 422
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    head 204
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :post_id)
  end
end
