class ChangeDefaultForCompletedInTaskManagers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :task_managers, :completed, from: true, to: false
  end
end
