class ChangeAccessOnLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :access, :string, null: false
  end
end
