class RemoveShippingFeeOnAddresses < ActiveRecord::Migration[5.2]
  def up
    remove_column :addresses, :shipping_fee, :integer
    add_column :orders, :shipping_fee, :integer
    change_column :orders, :shipping_fee, :integer, null: false
  end
end
