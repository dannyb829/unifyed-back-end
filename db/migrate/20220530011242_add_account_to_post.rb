class AddAccountToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :account_id, :integer
  end
end
