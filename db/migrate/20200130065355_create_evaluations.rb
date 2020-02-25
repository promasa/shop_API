class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.refarences :item
      t.refarences :evaluated
      t.refarences :evaluator
      t.integer :status

      t.timestamps
    end
  end
end
