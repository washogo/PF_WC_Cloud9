class AddColumnOnCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :customer_id, :integer
    change_column :lessons, :customer_id, :integer, null: false
  end
end
