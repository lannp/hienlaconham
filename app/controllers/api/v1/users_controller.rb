class Api::V1::UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  # before_action :authenticate_with_token!, only: [:update, :destroy]

  respond_to :json

  def index
    if(params[:more])
    users = User.load_more_user(params[:more])
    else
      users = User.all
    end
    render json: users, each_serializer: UserSerializer
  end

  def show
    respond_with User.find(params[:id]), serializer: UserSerializer, get_post: true
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422, serializer: UserSerializer, get_post: true
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

end
