class PostSerializer < ActiveModel::Serializer
  attributes :id, :user, :description, :created_at, :vote_count, :isVoted, :vote_id, :comment_count

  # has_one :user
  has_many :comments
  # byebug
  delegate :current_user, to: :scope
  def user_name
    return object.user.as_json(only: [:id, :name, :avatar])
  end

  def vote_count
    return object.votes.count
  end

  def isVoted
    return object.users.include?(current_user)
  end

  def vote_id
    if !current_user.nil?
      if !object.votes.find_by(user_id: current_user.id).nil?
        return object.votes.find_by(user_id: current_user.id).id
      end
    end
  end

  def comment_count
    return object.comments.count
  end

end
