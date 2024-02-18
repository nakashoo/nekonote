class AddDeadlineDateToTaskManagers < ActiveRecord::Migration[6.1]
  def change
    add_column :task_managers, :deadline_date, :date
  end
end
