class DockWorker < ApplicationRecord
  belongs_to :state
  
  has_many :worker_schedules
  has_many :timeslots,:through=> :worker_schedules
  has_many :shipments
  has_many :appointments, :through => :shipments

  validates_uniqueness_of :last_name, scope: :first_name,
                          message: 'A worker with that first and last name and address is already in the system.'
end
