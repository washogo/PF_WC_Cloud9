class AddColumnOnEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :lesson_id, :integer
    change_column :evaluations, :lesson_id, :integer, null: false
    
  end
end
