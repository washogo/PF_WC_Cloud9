class ChangeColumnNullOnEvaluationLists < ActiveRecord::Migration[5.2]
  def change
    change_column :evaluation_lists, :evaluation_id, :integer, null: false
  end
end
