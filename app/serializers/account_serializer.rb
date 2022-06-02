class AccountSerializer < ActiveModel::Serializer
  attributes :id, 
              :email, 
              :first_name,
              :last_name,
              :image_url,
              :account_access,
              :username,
              :bio,
              :followers_amount,
              :followees_amount,
              :user_followed,
              :follows_user

              def followees_amount
                object.followees.count
              end
              
              def followers_amount
                object.followers.count
              end

              def follows_user
                !!Friendship.find_by(followee: Current.user, follower: object)
              end

end
