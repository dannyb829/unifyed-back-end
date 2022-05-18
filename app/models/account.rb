class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :headlines, through: :comments
  # has_many :headlines

  has_many :followed, foreign_key: :follower_id, :class_name => 'Friendship'
  has_many :followees, through: :followed

  has_many :following, foreign_key: :followee_id,:class_name => 'Friendship'
  has_many :followers, through: :following

end
