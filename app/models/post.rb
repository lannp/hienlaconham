class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :users, through: :votes
  has_many :comments

  scope :find_by_user, ->(user_id){where(user_id: user_id)}
  scope :get_posts, ->(id){where('id> ?', id).limit(3)}

end
