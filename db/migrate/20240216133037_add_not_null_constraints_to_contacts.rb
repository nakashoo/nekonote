class AddNotNullConstraintsToContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :title, :string, null: false
    change_column :contacts, :body, :text, null: false
    change_column :contacts, :customer_id, :integer, null: false
  end
end
