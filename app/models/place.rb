class Place < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :name, presence: true
end
