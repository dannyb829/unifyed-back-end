class Headline < ApplicationRecord
    has_many :comments
    has_many :accounts, through: :comments
    has_many :likes, as: :likeable
end
