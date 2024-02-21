class AddAdminReadToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :admin_read, :boolean
  end
end
