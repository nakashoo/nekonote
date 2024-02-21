class ChangeDefaultForAdminRead < ActiveRecord::Migration[6.1]
  def change
    change_column_default :contacts, :admin_read, from: true, to: false
  end
end
