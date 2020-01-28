class RenameOwnerIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :owner_id, :user_id
  end
end
