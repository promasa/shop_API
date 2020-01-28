class CreatePrivateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :private_chats do |t|
      t.string :text
      t.integer :from_id
      t.integer :to_id
      t.string :room_id

      t.timestamps
    end
    add_index :private_chats, [:room_id, :created_at]
  end
end
