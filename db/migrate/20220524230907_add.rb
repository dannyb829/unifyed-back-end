class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :unconfirmed_email, :string
  end
end
