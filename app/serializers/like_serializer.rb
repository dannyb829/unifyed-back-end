class LikeSerializer < ActiveModel::Serializer
  attributes :id, :likeable_id, :likeable_type, :account_id
  belongs_to :account
end
