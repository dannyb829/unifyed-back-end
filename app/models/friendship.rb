class Friendship < ApplicationRecord
    include PublicActivity::Common
    belongs_to :follower, class_name: "Account"
    belongs_to :followee, class_name: "Account"

    validates :follower, uniqueness: {scope: :followee, message: "User already followed"}
end
