class ChangeColumnsOnHaveLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :have_lessons, :is_in_study, :integer, null: false, default: 0
    change_column :have_lessons, :progress, :integer, null: false, default: 0
  end
end
