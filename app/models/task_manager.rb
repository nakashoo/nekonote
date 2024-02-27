class TaskManager < ApplicationRecord
  belongs_to :schedule
  belongs_to :task

  validates :schedule_id, presence: true
  validates :task_id, presence: true
  validates :deadline_date, presence: true

end
