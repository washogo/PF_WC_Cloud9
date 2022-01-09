class AddColumnOnLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :tag_id, :integer
    change_column :lessons, :tag_id, :integer, null: false
  end
end
