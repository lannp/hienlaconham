class Api::V1::FollowsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  respond_to :json

  def create
    follow = Follow.new(follow_params)
    if follow.save
      render json: follow, status: 201, location: [:api, follow]
    else
      render json: { errors: follow.errors }, status: 422
    end
  end

  def destroy
    follow = Follow.find_by(follower_id: current_user.id, followed_id: params[:id])
    follow.destroy
    head 204
  end

  private
  def follow_params
    params.require(:follow).permit(:followed_id, :follower_id)
  end
end
