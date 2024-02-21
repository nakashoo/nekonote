class ChangeDefaultAdminReadInContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :admin_read, :boolean, default: true
  end
end
