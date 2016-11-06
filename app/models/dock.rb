class Dock < ApplicationRecord
  has_many :reservations
  has_many :appointments, :through => :reservations
  has_many :dock_schedules
  has_many :timeslots, :through => :dock_schedules
end
