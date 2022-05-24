class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, 
              :email, 
              :first_name,
              :last_name,
              :image_url,
              :account_access,
              :username,
              :bio,
              :followers_amount,
              :followees_amount

              def followees_amount
                object.followees.count
              end
              
              def followers_amount
                object.followers.count
              end
end
