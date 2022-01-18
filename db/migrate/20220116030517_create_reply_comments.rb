class CreateReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_comments do |t|
      t.integer :customer_id, null: false
      t.integer :comment_id,  null: false
      t.text    :comment,     null: false
      
      t.timestamps
    end
  end
end
