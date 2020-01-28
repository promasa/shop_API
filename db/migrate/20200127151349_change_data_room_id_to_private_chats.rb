class ChangeDataRoomIdToPrivateChats < ActiveRecord::Migration[6.0]
  def change
    change_column :private_chats, :room_id, :string
  end
end
