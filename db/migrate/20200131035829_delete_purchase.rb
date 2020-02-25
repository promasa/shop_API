class DeletePurchase < ActiveRecord::Migration[6.0]
  def change
    drop_table :purchases
  end
end
