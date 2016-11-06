class Dock < ApplicationRecord
  has_many :reservation
  has_many :appointments, :through => :reservations
  has_and_belongs_to_many :timeslot
end
