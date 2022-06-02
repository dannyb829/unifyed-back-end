class Comment < ApplicationRecord
    include PublicActivity::Common
    belongs_to :account
    belongs_to :commentable, polymorphic: true
    has_many :likes, as: :likeable, dependent: :destroy

    private

    def user_liked 
        !!likes.find_by(account: Current.user)
    end
end
