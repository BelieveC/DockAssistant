class Dock < ApplicationRecord

  has_many :dock_schedules
  # has_many :timeslots, :through => :dock_schedules
  has_many :timeslots, :through => :appointments
  has_many :appointments
end
