class CreateItemChats < ActiveRecord::Migration[6.0]
  def change
    create_table :item_chats do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
