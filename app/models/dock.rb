class Dock < ApplicationRecord
  has_many :reservations
  has_many :appointments, :through => :reservations
  has_and_belongs_to_many :timeslots
end
