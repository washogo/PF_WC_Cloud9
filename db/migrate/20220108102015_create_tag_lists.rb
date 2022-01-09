class CreateTagLists < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_lists do |t|
      t.integer :lesson_id, null: false
      t.integer :tag_id,    null: false

      t.timestamps
    end
  end
end
