class RemoveColumnsOnLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :evaluation_list_id, :integer
    remove_column :lessons, :tag_id, :integer
  end
end
