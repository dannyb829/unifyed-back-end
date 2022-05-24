class Comment < ApplicationRecord
    belongs_to :account
    belongs_to :headline
    has_many :likes, as: :likeable
end
