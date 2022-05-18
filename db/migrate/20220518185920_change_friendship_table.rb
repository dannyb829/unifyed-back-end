class ChangeFriendshipTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :user_id
    add_column :friendships, :follower_id, :integer
    remove_column :friendships, :friend_id
    add_column :friendships, :followee_id, :integer
  end
end
