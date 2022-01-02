class ChangeColumnDefaultOnImageIdCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :image_id, from: "/learn_community/app/assets/images/22322188.png", to: ""
  end
end
