class Timeslot < ApplicationRecord
  has_many :worker_schedules
  has_many :dock_workers, through: :worker_schedules

  # has_many :dock_schedules
  has_many :docks, through: :appointments

  has_many :appointments
end
