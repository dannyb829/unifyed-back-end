class MakeCommentsPolymorphic < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :headline_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
