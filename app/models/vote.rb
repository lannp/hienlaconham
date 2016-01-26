class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :find_by_user_post, ->(user_id, post_id){where(user_id: user_id, post_id: post_id)}

end
