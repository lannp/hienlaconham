class Api::V1::CommentsController < ApplicationController
  respond_to :json

  def index
    respond_with Comment.all
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: 201, location: [:api, comment]
    else
      render json: { errors: comment.errors }, status: 422
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: comment, status: 200, location: [:api, comment]
    else
      render json: { errors: comment.errors }, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    head 204
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :cmt)
  end
end
