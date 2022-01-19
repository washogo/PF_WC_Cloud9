class CreateReplyRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_relationships do |t|
      t.integer :main_comment_id, null: false
      t.integer :reply_id,        null: false

      t.timestamps
    end
  end
end
