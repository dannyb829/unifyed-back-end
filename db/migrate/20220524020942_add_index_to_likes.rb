class AddIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :account_id, :integer
    add_index :likes, [:account_id, :likeable_id, :likeable_type], unique: true
    add_index :likes, [:likeable_id,:likeable_type]
  end
end
