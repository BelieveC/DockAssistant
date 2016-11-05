class Appointment < ApplicationRecord
  belongs_to :vendor

  has_many :shipments
  has_many :dock_workers, :through => :shipments

  has_many :reservations
  has_many :dock, :through => :reservations

end
