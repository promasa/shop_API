class ChangeStatusToEvaluation < ActiveRecord::Migration[6.0]
  def change
    change_column :evaluations, :status, :integer, :default => 0
  end
end
