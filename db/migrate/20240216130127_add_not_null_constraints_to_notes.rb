class AddNotNullConstraintsToNotes < ActiveRecord::Migration[6.1]
  def change
    change_column :notes, :title, :string, null: false
    change_column :notes, :body, :text, null: false
    change_column :notes, :admin_id, :integer, null: false
  end
end
