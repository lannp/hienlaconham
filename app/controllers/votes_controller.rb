class VotesController < ApplicationController
  def index

  end

  def create
    byebug
    @vote = Vote.create(post_id: params[:post_id], user_id: params[:user_id])
    if @vote.save
      flash[:success] = "voted"
    else
      flash[:danger] = "error"
    end
    redirect_to posts_path
  end

  private
  def vote_params
    params.require(:post).permit :post_id
  end
end
