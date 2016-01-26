class CommentSerializer < ActiveModel::Serializer
  attributes :id, :cmt

  has_one :user
end
