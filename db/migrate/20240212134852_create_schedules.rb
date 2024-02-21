class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string  :name          , null: false
      t.integer :place_id      , null: false
      t.date    :scheduled_date, null: false
      t.date    :confirmed_date, null: false
      t.timestamps
    end
  end
end
