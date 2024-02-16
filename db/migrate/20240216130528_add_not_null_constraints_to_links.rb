class AddNotNullConstraintsToLinks < ActiveRecord::Migration[6.1]
  def change
    change_column :links, :title, :string, null: false
    change_column :links, :url, :string, null: false
  end
end
