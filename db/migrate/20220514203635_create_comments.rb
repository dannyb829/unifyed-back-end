class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :content
      t.integer :agree
      t.integer :disagree

      t.timestamps
    end
  end
end
