class Schedule < ApplicationRecord
  belongs_to :place
  has_many :task_managers, dependent: :destroy
  accepts_nested_attributes_for :task_managers, reject_if: :all_blank, allow_destroy: true

  has_many :tasks, through: :task_managers

  validates :name, presence: true
  validates :place_id, presence: true
  validates :scheduled_date, presence: true
  validates :confirmed_date, presence: true
  validates :task_managers, presence: true
end
