class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user_liked, :account, :likes

  def user_liked 
    !!object.likes.find_by(account: Current.user)
end

end
