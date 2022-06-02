class Headline < ApplicationRecord
    include PublicActivity::Common
    has_many :accounts, through: :comments
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :headlines
    belongs_to :account

    def user_liked 
        !!likes.find_by(account: Current.user)
    end
end
