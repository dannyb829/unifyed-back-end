class Post < ApplicationRecord
    include PublicActivity::Common
    # tracked owner: -> (controller, model) { Current.user }
    belongs_to :account
    has_many :comments, as: :commentable
end
