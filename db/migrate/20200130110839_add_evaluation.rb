class AddEvaluation < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.references :item
      t.string :text
      t.references :evaluated, foreign_key: { to_table: :users }
      t.references :evaluator, foreign_key: { to_table: :users }
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end

