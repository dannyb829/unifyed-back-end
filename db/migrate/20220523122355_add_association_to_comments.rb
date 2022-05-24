class AddAssociationToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :headline_id, :integer
    add_column :comments, :account_id, :integer
  end
end
