class AddAccountToHeadline < ActiveRecord::Migration[7.0]
  def change
    add_column :headlines, :account_id, :integer
  end
end
