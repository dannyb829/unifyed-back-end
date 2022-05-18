class AddAccountAccessToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :account_access, :string
    add_column :accounts, :bio, :string
    add_column :accounts, :image_url, :string
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
  end
end
