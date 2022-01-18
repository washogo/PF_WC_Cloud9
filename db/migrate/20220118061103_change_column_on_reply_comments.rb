class ChangeColumnOnReplyComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :reply_comments, :comment, :content
  end
end
