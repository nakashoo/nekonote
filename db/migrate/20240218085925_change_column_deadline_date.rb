class ChangeColumnDeadlineDate < ActiveRecord::Migration[6.1]
  def change
    change_column :task_managers, :deadline_date, :date, null:false
  end
end
