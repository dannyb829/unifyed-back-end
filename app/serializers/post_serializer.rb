class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :author
end
