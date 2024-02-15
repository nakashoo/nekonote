class Schedule < ApplicationRecord
  belongs_to :place
  has_many :task_managers
  accepts_nested_attributes_for :task_managers, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :scheduled_date, presence: true
  validates :confirmed_date, presence: true
end
