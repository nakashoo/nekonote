class TaskManager < ApplicationRecord
  belongs_to :schedule
  belongs_to :task
end
