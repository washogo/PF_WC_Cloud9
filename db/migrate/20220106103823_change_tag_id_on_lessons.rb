class ChangeTagIdOnLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :tag_id, :integer
  end
end
