class DockWorker < ApplicationRecord
  belongs_to :state
  
  has_many :worker_schedules
  has_many :timeslots,:through=> :worker_schedules
  has_many :shipments
  has_many :appointments, :through => :shipments

  validates :first_name,uniqueness: {scope: :last_name,message:"Last and First Name already taken"}
  validates :address, presence: true,
  					 length: {minimum: 10}
  validates :zipcode, presence: true,
  					 length: {minimum: 6}
  validates :pay_rate,presence: true
  validates :state_id, presence: true
  validates :first_name,presence: true
  validates :last_name,presence: true

end

