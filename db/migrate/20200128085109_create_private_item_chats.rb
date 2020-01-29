class CreatePrivateItemChats < ActiveRecord::Migration[6.0]
  def change
    create_table :private_item_chats do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
