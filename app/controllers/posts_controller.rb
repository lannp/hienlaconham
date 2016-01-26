class PostsController < ApplicationController
  def index
    byebug
    @posts = Post.get_posts(params[:count]);
  end

  def show
    @post = Post.find(params[:id]);
  end
end
