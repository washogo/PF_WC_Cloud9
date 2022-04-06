class RemoveShippingFeeOnAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :shipping_fee, :integer
  end
end
