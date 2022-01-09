class CreateEvaluationLists < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_lists do |t|
      t.integer :lesson_id, null: false

      t.timestamps
    end
  end
end
