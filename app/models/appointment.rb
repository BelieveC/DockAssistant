class Appointment < ApplicationRecord
  belongs_to :vendor
  belongs_to :timeslot
  has_many :shipments
  has_many :dock_workers, :through => :shipments

  has_many :reservations
  has_many :dock, :through => :reservations

end
