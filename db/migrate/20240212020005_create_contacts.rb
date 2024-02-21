class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string  :title
      t.text    :body
      t.integer :customer_id
      t.timestamps
    end
  end
end
