class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts

  has_many :comments
  has_many :headlines
  # has_many :headlines

  
  has_many :followed, foreign_key: :follower_id, :class_name => 'Friendship'
  has_many :followees, through: :followed
  
  has_many :following, foreign_key: :followee_id,:class_name => 'Friendship'
  has_many :followers, through: :following
  
  # for when you start deleting accounts
  # has_many :friendships, as: :follower, dependent: :destroy
  
  validates_uniqueness_of :username
  has_many :likes

  private 
  

  def user_followed
    !!Friendship.find_by(follower: Current.user, followee: self)
  end

end
