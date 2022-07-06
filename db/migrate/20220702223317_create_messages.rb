class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender_id
      t.integer :reciever_id
      t.boolean :is_read
      t.timestamps
    end
  end
end
