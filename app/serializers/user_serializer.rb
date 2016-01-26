class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :avatar, :auth_token, :post_count, :follow,:following, :posts

  # delegate :current_user, to: :scope
  def avatar
    object.avatar.url
  end

  def post_count
    object.posts.count
  end

  def follow
    object.followers.map { |follower| follower.id  }
  end

  def following
    object.followeds.map { |followed| followed.id  }
  end

  def posts
    if(serialization_options[:get_post])
      posts = object.user_post.order(updated_at: :desc)
      posts.map{|post| PostSerializer.new(post, {scope: self.scope}).as_json["post"]}
    end
  end

end
