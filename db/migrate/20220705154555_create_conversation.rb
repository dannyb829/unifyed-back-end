class CreateConversation < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :reciever_id

      t.timestamps
    end
  end
end
