class ChangeEvaluationIdOnLessons < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :evaluation_id, :evaluation_list_id
  end
end
