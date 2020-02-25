class AddEvaluatorToEvaluator < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :evaluator, foreign_key: { to_table: :users }
    add_column :evaluations, :text, :string
  end
end