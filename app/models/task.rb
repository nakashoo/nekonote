class Task < ApplicationRecord
  has_many :task_managers, dependent: :destroy
  has_many :schedules, through: :task_managers
end
