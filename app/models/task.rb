class Task < ApplicationRecord
  has_many :task_managers
  has_many :schedules, through: :task_managers
end
