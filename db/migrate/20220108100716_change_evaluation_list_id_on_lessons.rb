class ChangeEvaluationListIdOnLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :evaluation_list_id, :integer, null: false
  end
end
