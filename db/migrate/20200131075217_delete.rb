class Delete < ActiveRecord::Migration[6.0]
  def change
    drop_table :private_item_chats
  end
end
