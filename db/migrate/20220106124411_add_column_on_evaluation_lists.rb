class AddColumnOnEvaluationLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :evaluations, :evaluation_list_id, :integer
  end
end
