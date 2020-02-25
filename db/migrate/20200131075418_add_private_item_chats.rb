class AddPrivateItemChats < ActiveRecord::Migration[6.0]
  def change
    create_table :private_item_chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
