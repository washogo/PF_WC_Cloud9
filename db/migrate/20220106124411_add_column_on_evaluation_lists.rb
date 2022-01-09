class AddColumnOnEvaluationLists < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluation_lists, :evaluation_id, :integer
    remove_column :evaluations, :evaluation_list_id, :integer
  end
end
