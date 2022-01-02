class ChangeColumnsDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :transfer_target, from: "振込先", to: ""
    change_column_default :customers, :nickname, from: "ニックネーム", to: ""
    change_column_default :customers, :profile, from: "プロフィール", to: ""
  end
end
