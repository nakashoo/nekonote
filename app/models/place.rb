class Place < ApplicationRecord
  has_many :schedules, dependent: :destroy
end
