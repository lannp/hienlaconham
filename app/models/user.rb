class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :votes
  has_many :comment
   has_many :active_relationships,  class_name:  "Follow",
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Follow",
    foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!
  mount_uploader :avatar, PictureUploader

  scope :load_more_user, ->(id){where('id> ?', id).limit(7)}

  def user_post
    followed_ids =  "SELECT followed_id FROM follows
      WHERE  follower_id = :user_id"
      # byebug
    Post.where("user_id IN ((#{followed_ids}), :user_id)", user_id: id)
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
