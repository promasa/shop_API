class DeleteItemChat < ActiveRecord::Migration[6.0]
  def change
    drop_table :item_chats
  end
end
