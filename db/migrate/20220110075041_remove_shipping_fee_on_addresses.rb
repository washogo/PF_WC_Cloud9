class RemoveShippingFeeOnAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :shipping_fee, :integer
    add_column :orders, :shipping_fee, :integer
    change_column :orders, :shipping_fee, :integer, null: false
  end
end
