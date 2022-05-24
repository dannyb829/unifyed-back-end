class RemoveCommentAttrs < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :agree, :agreeable_id
    rename_column :comments, :disagree, :agreeable_type
    change_column :comments, :agreeable_type, :string
  end
end
