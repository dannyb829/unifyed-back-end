class RemoveAttrsComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :agreeable_id
    remove_column :comments, :agreeable_type
    remove_column :comments, :username
  end
end
