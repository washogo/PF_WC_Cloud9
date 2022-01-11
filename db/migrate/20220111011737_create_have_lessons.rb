class CreateHaveLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :have_lessons do |t|
      t.integer :customer_id, null: false
      t.integer :lesson_id,   null: false
      t.integer :is_in_study, null: false
      t.integer :progress,    null: false

      t.timestamps
    end
  end
end
