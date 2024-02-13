class Schedule < ApplicationRecord
  belongs_to :place
  has_many :task_managers
  accepts_nested_attributes_for :task_managers, reject_if: :all_blank, allow_destroy: true
end
