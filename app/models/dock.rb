class Dock < ApplicationRecord
  has_many :reservation
  has_many :appointments, :through => :reservations
end
