class Like < ApplicationRecord
    validates :account_id, uniqueness:{ scope: [:likeable_id, :likeable_type]}
    belongs_to :account
    belongs_to :likeable, polymorphic: true
end
