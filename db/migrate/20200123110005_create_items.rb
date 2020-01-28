class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
