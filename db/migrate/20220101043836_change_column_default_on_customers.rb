class ChangeColumnDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :transfer_target, from: "", to: "振込先"
    change_column_default :customers, :nickname, from: "", to: "ニックネーム"
    change_column_default :customers, :profile, from: "", to: "プロフィール"
    change_column_default :customers, :image_id, from: "", to: "/learn_community/app/assets/images/22322188.png"
  end
end
