class Like < ApplicationRecord
    include PublicActivity::Common
    # tracked owner: -> (controller, model) { Current.user }
    validates :account_id, uniqueness:{ scope: [:likeable_id, :likeable_type]}
    belongs_to :account
    belongs_to :likeable, polymorphic: true
end
