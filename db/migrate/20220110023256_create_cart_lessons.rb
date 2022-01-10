class CreateCartLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_lessons do |t|
      t.integer :customer_id, null: false
      t.integer :lesson_id, null: false

      t.timestamps
    end
  end
end
