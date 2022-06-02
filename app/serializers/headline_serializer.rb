class HeadlineSerializer < ActiveModel::Serializer
  attributes :id, :content,:date ,:source, :image_url, :title, :user_liked, :author

  has_many :likes
  has_many :comments, serializer: CommentSerializer
end
