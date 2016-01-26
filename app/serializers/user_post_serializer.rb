class UserPostSerializer < ActiveModel::Serializer
  attributes :id

end
# class UserSerializer < ActiveModel::Serializer
#   attributes :id, :email, :name, :avatar, :following, :followed, :posts

#   delegate :current_user, to: :scope
#   def avatar
#     object.avatar.url
#   end

#   def following
#     object.followers.map{|follower| follower.id}
#   end

#   def followed
#     object.followeds.map{|follower| follower.id}
#   end

#   def posts
#     posts = object.user_post.order(updated_at: :desc)
#     posts.map{|post| PostSerializer.new(post, {scope: self.scope}).as_json}
#   end

# end
