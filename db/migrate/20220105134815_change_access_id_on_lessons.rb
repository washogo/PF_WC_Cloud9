class ChangeAccessIdOnLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :access_id, :integer
    add_column :lessons, :access, :string
  end
end
