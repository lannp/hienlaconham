class Api::V1::PostsController < ApplicationController
	respond_to :json

	def index
		Post.all.each do |post|
			time = (Time.now() - post.created_at)/(3600).to_i
			vote = post.votes.count
			_strong_point = (vote -1)/((time+ 2)*1.8)
			post.update(strong_point: _strong_point)
		end
		if(params[:user_id])
			posts = Post.find_by_user(params[:user_id])
		elsif (params[:count])
			posts = Post.get_posts(params[:count])
		else
			posts = Post.all
		end
		respond_with posts.order(strong_point: :desc)
	end

	def show
		respond_with Post.find(params[:id])
	end

	def create
		post = Post.new(post_params)
		if post.save
			render json: post, status: 201, location: [:api, post]
		else
			render json: { errors: post.errors }, status: 422
		end
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			render json: post, status: 200, location: [:api, post]
		else
			render json: {errors: post.errors}, status: 422
		end
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		head 204
	end

	private
	def post_params
		params.require(:post).permit(:user_id, :description, :strong_point)
	end
end
