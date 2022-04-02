class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.integer   :customer_id, null: false
      t.integer   :method, null: false
      t.timestamps
    end
  end
end
