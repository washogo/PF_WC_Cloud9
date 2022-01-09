class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :customer_id,        null: false
      t.integer :evaluation_list_id, null: false
      t.integer :evaluation,         null: false

      t.timestamps
    end
  end
end
