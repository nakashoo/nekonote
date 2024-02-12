class CreateTaskManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :task_managers do |t|
      t.integer :schedule_id  , null: false
      t.integer :task_id      , null: false
      t.boolean :completed    , null: false, default: true
      t.timestamps
    end
  end
end
