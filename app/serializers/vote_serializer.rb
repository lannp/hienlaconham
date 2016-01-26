class VoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id

  has_one :post_id
end
